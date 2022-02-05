# Maintainer: 
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: leif_thande <leif.thande@gmail.com>
# Contributor: tranquility <trankas@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=atool
pkgver=0.39.0
pkgrel=7
pkgdesc="A script for managing file archives of various types"
arch=('any')
url="https://www.nongnu.org/atool/"
license=('GPL3')
depends=('file' 'perl')
optdepends=('bzip2: for using atool with bzip2 compressed archives'
            'cpio: for using atool with cpio archives'
            'gzip: for using atool with gzip compressed archives'
            'lha: for using atool with lha, lharc and similar archives'
            'xz: for using atool with lzma compressed archives'
            'lzop: for using atool with lzop compressed archives'
            'p7zip: for using atool with 7z archives'
            'tar: for using atool with tar archives'
            'unace: for using atool with ace archives'
            'unrar: for using atool with rar archives'
            'zip: for using atool for creating zip archives'
            'unzip: for using atool for unpacking archives')
changelog=$pkgname.changelog
source=(https://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('4E6E6521EF300E30457D7AFB8AAAC30E7088EFCB') # Oskar Liljeblad <oskar@osk.mine.nu>
sha256sums=('aaf60095884abb872e25f8e919a8a63d0dabaeca46faeba87d12812d6efc703b'
            'SKIP')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
