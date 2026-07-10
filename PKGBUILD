# Maintainer: tee < teeaur at duck dot com >

pkgname=pdfsam-bin
pkgver=6.0.3
pkgrel=1
pkgdesc="PDFsam Basic, a desktop application to split, merge, mix, rotate PDF files and extract pages(without java dependency)"
arch=(x86_64)
url='https://pdfsam.org'
license=('AGPL-3.0-or-later')
provides=(pdfsam)
depends=(gtk3)
source_x86_64=("https://github.com/torakiki/pdfsam/releases/download/v$pkgver/pdfsam-basic_$pkgver-1_amd64.deb") #{,.asc})
sha256sums_x86_64=('2d40fa2bf0c33ef422ec176cc647e2f37c15d44551f5e37f922cd6dbef6ab491')

package() {
  cd "$pkgdir"
  tar -xf "$srcdir"/data.tar.gz
  chmod 755 opt/pdfsam-basic/runtime/bin/{java,keytool}
  mv usr/bin/pdfsam{,.sh}
}
