# Maintainer: tee < teeaur at duck dot com >

pkgname=pdfsam-bin
pkgver=6.0.5
pkgrel=1
pkgdesc="PDFsam Basic: Merge, split, extract pages, rotate and mix your PDF files(without java dependency)"
arch=(x86_64)
url='https://pdfsam.org'
license=('AGPL-3.0-or-later')
provides=(pdfsam)
depends=(gtk3)
source_x86_64=("https://github.com/torakiki/pdfsam/releases/download/v$pkgver/pdfsam-basic_$pkgver-1_amd64.deb") #{,.asc})
sha256sums_x86_64=('99cf8fc0ea49dadc3420e2b4989358b02089f762cd9f8d9ef17ea53da2779919')

package() {
  cd "$pkgdir"
  tar -xf "$srcdir"/data.tar.gz
  chmod 755 opt/pdfsam-basic/runtime/bin/{java,keytool}
  mv usr/bin/pdfsam{,.sh}
}
