# Maintainer: arkhan <arkhan@disroot.org>
pkgname=python-ueberzug
_pkgname=ueberzug
pkgver=18.1.3
pkgrel=2
pkgdesc="ueberzug is an python script which aims to replace w3mimgdisplay"
arch=('any')
license=('GPL')
depends=("libxext" "python-pillow-simd" "python" "python-xlib" "python-docopt" "python-psutil" "python-attrs")
makedepends=("python" "python-setuptools")
conflicts=("python-${_pkgname}-git")
url='https://github.com/seebye/ueberzug'
source=("https://github.com/seebye/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('9fc30060ca796ccd27163ae057c7e30c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
