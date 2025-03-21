# Maintainer: fabon <syobon.hinata.public[at]gmail[dot]com>
pkgname=hgrep-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Grep with human-friendly search results"
arch=('x86_64')
url="https://github.com/rhysd/hgrep"
license=('MIT')
depends=()
makedepends=('unzip')

source=("${pkgname}-${pkgver}.zip::https://github.com/rhysd/hgrep/releases/download/v${pkgver}/hgrep-v${pkgver}-x86_64-unknown-linux-musl.zip")
noextract=("${pkgname}-${pkgver}.zip")
md5sums=('6d5969cfd945c75fca65456486ea6386')

prepare() {
  unzip "${pkgname}-${pkgver}.zip"
  mv hgrep*/hgrep .
  mv hgrep*/LICENSE.txt .
  rm "${pkgname}-${pkgver}.zip"
  rm -r hgrep-*
}

package() {
  chmod +x "${srcdir}/hgrep"
  install -Dm755 "${srcdir}/hgrep" "${pkgdir}/usr/bin/hgrep"
  install -Dm755 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
