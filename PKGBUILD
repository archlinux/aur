# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="binggpt-desktop-bin"
pkgver="0.3.7"
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
sha256sums=('09f791fd5bab28a5754df34575a115e8e14c262a2cb1244749d5128a73593ca2')

prepare() {
	ar p BingGPT-${pkgver}-linux-x64.deb data.tar.xz | tar --zstd -x
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}
