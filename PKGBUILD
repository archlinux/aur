# Maintainer: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=3.4.0
pkgrel=1
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='https://docs.openstack.org/infra/jenkins-job-builder/'
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python-six>=1.9.0'
  'python-yaml>=3.10.6'
  'python-yaml<6'
  'python-pbr>=1.8'
  'python-stevedore>=1.17.1'
  'python-python-jenkins>=0.4.15'
  'python-fasteners'
  'python-jinja>=2')
source=("https://files.pythonhosted.org/packages/48/8e/5859e69abcd1df0ea8981fbea48865d52200faf2b7ca33bfb4412920169b/jenkins-job-builder-3.4.0.tar.gz")
sha512sums=('5f040078e8da3d108e5b96b503303c8f3419168ff135f2eca724bb8cbb2d46e726d759d6d3b9586f16a6f011026271d218297adff600199fd88bd59610a25fd5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
