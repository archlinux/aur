# Maintainer: tee < teeaur at duck dot com >

pkgname=pdfsam-bin
pkgver=6.0.1
pkgrel=1
pkgdesc="PDFsam, a desktop application to split, merge, mix, rotate PDF files and extract pages(without java dependency)"
arch=(x86_64)
url='https://pdfsam.org'
license=('AGPL-3.0-or-later')
depends=('glib2' 'gtk3')
source_x86_64=("https://github.com/torakiki/pdfsam/releases/download/v$pkgver/pdfsam-basic_$pkgver-1_amd64.deb") #{,.asc})
sha256sums_x86_64=('d47f8715c56ac70d4bed4e7fba4720af11d75db2f5ad9cee0590b72e6a7339ed')

package() {
  cd "$pkgdir"
  tar -xf "$srcdir"/data.tar.gz
  chmod 755 "opt/pdfsam-basic/runtime/bin/"{java,keytool}
  mv usr/bin/pdfsam usr/bin/pdfsam.sh
}
