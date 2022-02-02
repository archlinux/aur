# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pyston-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="A fork of CPython with additional optimizations for performance"
arch=('x86_64')
url="https://blog.pyston.org/"
license=('custom')
depends=('glibc' 'db' 'sqlite' 'tcl' 'xz')
makedepends=('libarchive')
provides=('pyston')
conflicts=('pyston')
source=("LICENSE::https://raw.githubusercontent.com/pyston/pyston/pyston_master/LICENSE")
source_x86_64=("https://github.com/pyston/pyston/releases/download/pyston_$pkgver/pyston_${pkgver}_20.04.deb")
sha256sums=('SKIP')
sha256sums_x86_64=('61c7911a3738efbc65b69d595ef367c303cc6332258f8836029faad263f99cc8')


package() {
  bsdtar -xf "pyston_${pkgver}_20.04.deb"
  tar -xf "data.tar.xz" -C "$pkgdir"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/pyston"
}
