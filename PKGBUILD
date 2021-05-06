# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pyston-bin
pkgver=2.2
pkgrel=1
pkgdesc="A fork of CPython with additional optimizations for performance"
arch=('x86_64')
url="https://github.com/pyston/pyston"
license=('custom')
depends=('glibc' 'db' 'sqlite' 'tcl' 'xz')
makedepends=('libarchive')
provides=('pyston')
conflicts=('pyston')
source=("https://github.com/pyston/pyston/releases/download/pyston_${pkgver}/pyston_${pkgver}_20.04.deb"
        "LICENSE::https://raw.githubusercontent.com/pyston/pyston/pyston_master/LICENSE")
sha256sums=('36cfad35153686b144861c835bab0c67e7cdc512dbe46cfc57400be482db17f2'
            'SKIP')


package() {
  bsdtar -xf "pyston_${pkgver}_20.04.deb"
  tar -xf "data.tar.xz" -C "$pkgdir"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/pyston"
}
