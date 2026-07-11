# Maintainer: tee < teeaur at duck dot com >

pkgname=pdfsam-bin
pkgver=6.0.4
pkgrel=1
pkgdesc="PDFsam Basic: Merge, split, extract pages, rotate and mix your PDF files(without java dependency"
arch=(x86_64)
url='https://pdfsam.org'
license=('AGPL-3.0-or-later')
provides=(pdfsam)
depends=(gtk3)
source_x86_64=("https://github.com/torakiki/pdfsam/releases/download/v$pkgver/pdfsam-basic_$pkgver-1_amd64.deb") #{,.asc})
sha256sums_x86_64=('22cd0c780750170a1e40d3bd8286f4ba640771ec3bb8600878925666776f99cd')

package() {
  cd "$pkgdir"
  tar -xf "$srcdir"/data.tar.gz
  chmod 755 opt/pdfsam-basic/runtime/bin/{java,keytool}
  mv usr/bin/pdfsam{,.sh}
}
