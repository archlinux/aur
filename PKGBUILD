# Maintainer: fabon <syobon.hinata.public[at]gmail[dot]com>
pkgname=hgrep-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Grep with human-friendly search results"
arch=('x86_64')
url="https://github.com/rhysd/hgrep"
license=('MIT')
depends=()
makedepends=('zip')

source=("hgrep.zip::https://github.com/rhysd/hgrep/releases/download/v${pkgver}/hgrep-v${pkgver}-x86_64-unknown-linux-musl.zip")
noextract=('hgrep.zip')
md5sums=('679005cc6205df889a8266f0ba18666a')

prepare() {
  unzip hgrep.zip
  mv hgrep*/hgrep .
  mv hgrep*/LICENSE.txt .
  rm hgrep.zip
  rm -r hgrep-*
}

package() {
  chmod +x "${srcdir}/hgrep"
  install -Dm755 "${srcdir}/hgrep" "${pkgdir}/usr/bin/hgrep"
  install -Dm755 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
