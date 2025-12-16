# Maintainer: Your Name <your@email.com>
pkgname=pixelterm-c
pkgver=1.2.5
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
md5sums_x86_64=('b82019fc50c468a077c54edcf26496c2')
md5sums_aarch64=('c246cf08e2f19ddb8b6a3e71fe9be2e0')

prepare() {
  find "${srcdir}" -maxdepth 1 -type f -name 'pixelterm-*' ! -name "pixelterm-${pkgver}" -delete
}

package() {
  install -Dm755 "${srcdir}/pixelterm-${pkgver}" "${pkgdir}/usr/bin/pixelterm"
}
