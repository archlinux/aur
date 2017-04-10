# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=python-jenkins
pkgname=python-$_pkgname
pkgver=0.4.14
pkgrel=1
pkgdesc="A python wrapper for the Jenkins REST API which aims to provide a more conventionally pythonic way of controlling a Jenkins server"
url='https://git.openstack.org/cgit/openstack/python-jenkins'
license=('BSD')
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'python-pbr' 'python-six' 'python-multi_key_dict')
source=("https://pypi.io/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('3d3cc9e7e48809f00357ff1bbf5b6061')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -D COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
