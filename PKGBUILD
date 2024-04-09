# Maintainer: Zachary Siedlecki <zacharysiedlecki01@gmail.com>
pkgname='superfile-bin'
_pkgname='superfile'
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="tui file manager"
arch=('x86_64')
url="https://github.com/MHNightCat/superfile"
license=('MIT')
depends=(
  'perl-image-exiftool'
)
optdepends=(
  'perl-archive-zip: Support for zip files, including epub'
  'perl-io-compress-brotli: Support for brotli-compressed metadata' 
)
provides=('superfile')
conflicts=('superfile')
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}-amd64.tar.gz")
sha256sums=('SKIP')
validpgpkeys=('SKIP')

build() {
  chmod +x "${srcdir}/dist/${_pkgname}-linux-v${pkgver}-amd64/spf"
}

package() {
  install -Dm755 "${srcdir}/dist/${_pkgname}-linux-v${pkgver}-amd64/spf" "${pkgdir}/usr/bin/${_pkgname}"
}
