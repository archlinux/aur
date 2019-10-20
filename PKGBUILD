# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=python-jenkins
pkgname=python-$_pkgname
pkgver=1.5.0
pkgrel=1
pkgdesc="A python wrapper for the Jenkins REST API which aims to provide a more conventionally pythonic way of controlling a Jenkins server"
url='https://opendev.org/jjb/python-jenkins/'
license=('BSD')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-six'
  'python-pbr'
  'python-multi_key_dict'
  'python-requests'
)
source=("https://pypi.io/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('a3557a301d6429f7549df06471322c98f068bc170c3569382ba55b80b6026e161f14fd645a6da5832ffe36b0753b0485a7eaba5ae9112d535bdf8436a13e8199')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -D COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
