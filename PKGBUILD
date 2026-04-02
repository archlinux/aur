# Maintainer: $MAINTAINER

pkgname=rumus
pkgver=0.1.14
pkgrel=1
pkgdesc="Next-generation terminal"
arch=('x86_64' 'aarch64')
url="https://rumus.ai"
license=('Proprietary')
depends=('webkit2gtk-4.1' 'gtk3')
source_x86_64=("rumus.deb::https://bucket.rumus.ai/rumus-releases/${pkgver}/linux-x64/rumus.deb")
source_aarch64=("rumus.deb::https://bucket.rumus.ai/rumus-releases/${pkgver}/linux-arm64/rumus.deb")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
    curl -s "https://www.rumus.ai/community/posts/2" | grep -oP 'Rumus v\K[0-9]+\.[0-9]+\.[0-9]+' | head -1
}

package() {
    bsdtar -xf "${srcdir}/rumus.deb"
    bsdtar -xf data.tar.gz -C "${pkgdir}"
}
