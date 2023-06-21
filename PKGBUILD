# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=python-jenkins
pkgname=python-$_pkgname
pkgver=1.8.0
pkgrel=1
pkgdesc="A python wrapper for the Jenkins REST API which aims to provide a more conventionally pythonic way of controlling a Jenkins server"
url='https://opendev.org/jjb/python-jenkins/'
license=('BSD')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-six>=1.3.0'
  'python-pbr>=0.8.2'
  'python-multi_key_dict'
  'python-requests'
)
source=("https://pypi.io/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('b08ab34af3cd37ab997577573e4e22bf1d2c4d14e2ec203d34df9b7c66f105bf98b570832a4b020cd0d42918ee35549ea03fc84aeb99ae1df5f3a9e86396a8e5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -D COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
