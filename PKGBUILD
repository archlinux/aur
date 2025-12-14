# Maintainer: Your Name <your@email.com>
pkgname=pixelterm-c
pkgver=1.0.17
pkgrel=1
pkgdesc="A high-performance terminal image browser written in C, based on the Chafa library"
arch=('x86_64' 'aarch64')
url="https://github.com/zouyonghe/PixelTerm-C"
license=('LGPL-3.0-or-later')
depends=('chafa' 'glib2' 'gdk-pixbuf2')
makedepends=('pkgconf')
provides=('pixelterm-c')
options=('!debug' '!strip')
source_x86_64=("pixelterm-${pkgver}::${url}/releases/download/v${pkgver}/pixelterm-amd64-linux")
source_aarch64=("pixelterm-${pkgver}::${url}/releases/download/v${pkgver}/pixelterm-arm64-linux")
noextract=()
md5sums_x86_64=('5740c6d359d4b0c462ff03148a9f6057')
md5sums_aarch64=('6f1565e08bcee65c2ff68d60ea6f9c5d')

prepare() {
  find "${srcdir}" -maxdepth 1 -type f -name 'pixelterm-*' ! -name "pixelterm-${pkgver}" -delete
}

package() {
  install -Dm755 "${srcdir}/pixelterm-${pkgver}" "${pkgdir}/usr/bin/pixelterm"
}
