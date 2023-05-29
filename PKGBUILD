# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="binggpt-desktop-bin"
pkgver="0.3.6"
pkgrel=1
pkgdesc="Desktop application of new Bing's AI-powered chat"
arch=("x86_64")
url="https://github.com/dice2o/BingGPT"
makedepends=("binutils"
             "tar")
depends=("at-spi2-core"
        "alsa-lib"
        "gtk3"
        "nss")
provides=("binggpt-desktop=${pkgver}")
conflicts=('binggpt-desktop')
license=("Apache")
source=("https://github.com/dice2o/BingGPT/releases/download/v${pkgver}/BingGPT-${pkgver}-linux-x64.deb")
sha256sums=('563a3537677effa76b688dabd21b9f45e93f70b541c6dae5b8edd30833abdf74')

prepare() {
	ar p BingGPT-${pkgver}-linux-x64.deb data.tar.xz | tar --zstd -x
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}
