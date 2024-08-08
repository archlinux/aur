# Maintainer: Keiran <keiran0@proton.me>

pkgname=ezc
pkgver=1.1
pkgrel=1
pkgdesc="A tool to take and upload screenshots"
arch=('x86_64')
url="https://github.com/keiranscript/ezc"
license=('GPL3')
depends=('curl' 'cjson' 'grim' 'slurp')
source=("https://github.com/keiranscript/ezc/archive/refs/heads/main.zip")
md5sums=('SKIP') # Replace SKIP with the actual checksum

prepare() {
  cd "${srcdir}"
  unzip main.zip
}

build() {
  cd "${srcdir}/ezc-main"
  make
}

package() {
  cd "${srcdir}/ezc-main"
  install -Dm755 ezc "${pkgdir}/usr/bin/ezc"
}
