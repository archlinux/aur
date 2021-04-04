# Maintainer: Giovanni Zaccaria <giozaccaria02@gmail.com>

pkgname=texted-bin
_pkgname=texted
pkgver=1.5
_pkgver=1.5.1
pkgrel=1
pkgdesc="A simple ed-like CLI text editor"
arch=(x86_64)
url="https://github.com/Leonia-Tech/TextEd"
depends=('make>4' 'gcc>10' 'python>=3.9.0' 'ncurses' 'readline')
optdepends=('mpv')
source=("https://github.com/Leonia-Tech/texted/archive/refs/tags/v1.5.1.tar.gz")
md5sums=('2aca52bc4cf86eeef908ab87ca87387c')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  make DEBUG=0 ARCH_LINUX=1
}

# 755 = rwxr-xr-x	directories and binaries
# 644 = rw-r--r--	regular files

package() {
 	cd "${srcdir}/${_pkgname}-${_pkgver}"

 	make DEBUG=0 DESTDIR=${pkgdir} install
}