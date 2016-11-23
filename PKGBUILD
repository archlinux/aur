# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=1.6.1
pkgrel=1
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='http://docs.openstack.org/infra/system-config/jjb.html'
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
depends=('python-yaml' 'python-python-jenkins')
source=("https://pypi.io/packages/source/j/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('a34d25d93937ea0a13a73414c85c6564')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
