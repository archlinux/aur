# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="binggpt-desktop-bin"
pkgver="0.3.3"
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
sha256sums=('9211a93f701a0e339f7100cac0d3cb863c04a0f34f3fd06f0d98df1675a2b6ca')

prepare() {
	ar p BingGPT-${pkgver}-linux-x64.deb data.tar.xz | tar --zstd -x
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}
