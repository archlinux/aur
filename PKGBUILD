# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pyston-bin
pkgver=2.3.1
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
sha256sums_x86_64=('184d041e993877f4fa1ea07a42f93afe09f935b0796cf8bc9f78a87b2a61f7ee')


package() {
  bsdtar -xf "pyston_${pkgver}_20.04.deb"
  tar -xf "data.tar.xz" -C "$pkgdir"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/pyston"
}
