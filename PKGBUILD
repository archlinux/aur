# Maintainer: Rafael Campos Las Heras <methril at gmail dot com>

pkgname=tcl-vfs
pkgname_orig=tclvfs
pkgver=20250918223207
git_hash=7fd65a0dda
pkgrel=1
pkgdesc="virtual file system for tcl"
arch=('i686' 'x86_64')
url="https://core.tcl-lang.org/tclvfs/"
license=('custom')
depends=(tcl)
makedepends=(tcl)
conflicts=(tclvfs-cvs)
source=(https://core.tcl-lang.org/${pkgname_orig}/tarball/${pkgname_orig}-${pkgver}-${git_hash}.tar.gz)
md5sums=('91ee5a152adeb9037cc51fc7f8a98e3f')

build() {
  cd "${pkgname_orig}-$pkgver-$git_hash"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname_orig}-$pkgver-$git_hash"

  make DESTDIR="$pkgdir/" install
  install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
