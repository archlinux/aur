# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="binggpt-desktop-bin"
pkgver="0.3.2"
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
sha256sums=('c774ac1da35efc65377da94bfde453761a22eb323a64c98e3f3e1b5265579d04')

prepare() {
	ar p BingGPT-${pkgver}-linux-x64.deb data.tar.zst | tar --zstd -x
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}
