# Maintainer: tee < teeaur at duck dot com >
pkgname=pdfsam-bin
pkgver=6.0.6
pkgrel=1
pkgdesc="PDFsam Basic: Split, merge, extract pages, rotate and mix your PDF files(without Java dependency)"
#pkgdesc="PDFsam Basic: The free app to split, merge, extract, rotate and mix PDF files (without Java dependency)"
arch=(x86_64)
url='https://pdfsam.org'
license=('AGPL-3.0-or-later')
provides=(pdfsam)
depends=(gtk3)
source_x86_64=("https://github.com/torakiki/pdfsam/releases/download/v$pkgver/pdfsam-basic_$pkgver-1_amd64.deb") #{,.asc})
sha256sums_x86_64=('318bf08c464d43e2f8a78057dcfb3c0fc8bdb5870e3608b0d783c4035f88d466')

package() {
  cd "$pkgdir"
  tar -xf "$srcdir"/data.tar.gz
  chmod 755 opt/pdfsam-basic/runtime/bin/{java,keytool}
  mv usr/bin/pdfsam{,.sh}
}
