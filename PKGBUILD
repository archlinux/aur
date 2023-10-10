# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Andrew Whatson <whatson@gmail.com>

pkgname=shroud
pkgver=0.1.2
pkgrel=1
pkgdesc='A simple command-line secret manager using GNU Guile'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('guile' 'gnupg' 'xclip')
url="https://dthompson.us/projects/shroud.html"
source=("https://files.dthompson.us/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "fix-version-detect.patch")
sha256sums=('37c58fa15cf6a0c0c0af9f96f26311bd62066d398b479cb29adf71b661865ad0'
            '427dc6f5cc4185c2138ba454d7a822d3f99853e0881cfb3361a9ac8588fe9b18')

build() {
  cd ${pkgname}-${pkgver}
  GUILE=/usr/bin/guile ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
