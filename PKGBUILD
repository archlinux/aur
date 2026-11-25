
pkgname=nijiexpose-bin
pkgver=v1.0.0beta3.dlast
_githubrel=dlang-last
pkgrel=1
pkgdesc="Application that allows streaming with nijilive puppets (VTuber, fork of Inochi2D which is like Live2D)"
arch=('x86_64')
url='https://github.com/nijigenerate/nijiexpose'
license=('BSD-2-Clause')
provides=('nijiexpose')
makedepends=(unzip)
depends=(freetype2 sdl2-compat libpng bzip2 zlib zstd brotli dbus openssl-3 gcc-libs systemd-libs)
source=(
	"nijiexpose-linux-x86_64-$pkgver.zip::https://github.com/nijigenerate/nijiexpose/releases/download/$_githubrel/nijiexpose-linux-x86_64.zip"
	"nijiexpose.desktop"
)

sha256sums=('29b92e0bc3452ed2e5fdfbcbb8a7187d5326c934255c164dcdbe060520456277'
            'b30a05243e75d4b3c7abec704fcf3aa399f6a335f137f9c13117f066868237f4')

package() {

    install -Dm644 "nijiexpose.desktop" "$pkgdir/usr/share/applications/nijiexpose.desktop"

    mkdir -p "$pkgdir/usr/lib/nijiexpose"
    unzip "nijiexpose-linux-x86_64-$pkgver.zip" -d "$pkgdir/usr/lib/nijiexpose/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/nijiexpose/nijiexpose "$pkgdir/usr/bin/nijiexpose"
}

