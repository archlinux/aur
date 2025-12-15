# Maintainer: Your Name <your@email.com>
pkgname=pixelterm-c
pkgver=1.1.11
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
md5sums_x86_64=('ea00dcb71ff25e07fcd9217dd837bef4')
md5sums_aarch64=('501a3f8ee4f9a9c04f9ab941fd2b9cc8')

prepare() {
  find "${srcdir}" -maxdepth 1 -type f -name 'pixelterm-*' ! -name "pixelterm-${pkgver}" -delete
}

package() {
  install -Dm755 "${srcdir}/pixelterm-${pkgver}" "${pkgdir}/usr/bin/pixelterm"
}
