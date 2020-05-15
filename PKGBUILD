# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=python-jenkins
pkgname=python-$_pkgname
pkgver=1.7.0
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
sha512sums=('b845c60af9bcd52f8f4783cf23da2d6752d0ddb3182798aadd9fa13a032cfd327f4cfbdf7d84c053e8683ecff1cb9bb0e52099db54f1a15c4c85b22cd466fd25')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -D COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
