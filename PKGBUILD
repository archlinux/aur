# Maintainer: Tilman BLUMENBACH <tilman AT ax86 DOT net>
pkgname=7zip-docs
pkgver=26.01
pkgrel=1
pkgdesc='HTML documentation for the 7-Zip file archiver'
url='https://7-zip.org/'
license=(LGPL-2.1-or-later BSD-3-Clause LicenseRef-UnRAR)
install=7zip-docs.install
source=("https://7-zip.org/a/7z${pkgver//.}-linux-x64.tar.xz")
arch=(any)
depends=("7zip=${pkgver?}")
options=(docs)

package() {
    cd MANUAL
    install -d "${pkgdir?}/usr/share/doc/7zip"
    cp -RP . "${pkgdir?}/usr/share/doc/7zip" 
    find "${pkgdir?}/usr/share/doc/7zip" -type f -execdir chmod 644 {} +
    find "${pkgdir?}/usr/share/doc/7zip" -type d -execdir chmod 755 {} +
}

sha256sums=('8ea0fc8a135e7b848e80a4116fe22dff56c8c4518dde1f43cce67f4e340b437a')
