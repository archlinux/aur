
pkgname=nijiexpose-bin
pkgver=v0.9.0rc3
_githubrel=v0.9.0-rc3
pkgrel=1
pkgdesc="Application that allows streaming with nijilive puppets (VTuber, fork of Inochi2D which is like Live2D)"
arch=('x86_64')
url=''
license=('BSD-2-Clause')
provides=('nijiexpose')
depends=(dbus freetype2 gcc-libs sdl2 glibc)
source=(
	"nijiexpose-linux-x86_64-$pkgver.zip::https://github.com/nijigenerate/nijiexpose/releases/download/$_githubrel/nijiexpose-linux-x86_64.zip"
	"nijiexpose.desktop"
)

sha256sums=('bd9f3a861044c45caf6dadddf152c4cf53cb83f8f891982e0c17aed402ed1ddc'
            'b30a05243e75d4b3c7abec704fcf3aa399f6a335f137f9c13117f066868237f4')

package() {

    install -Dm644 "nijiexpose.desktop" "$pkgdir/usr/share/applications/nijiexpose.desktop"

    mkdir -p "$pkgdir/usr/lib/nijiexpose"
    unzip "nijiexpose-linux-x86_64-$pkgver.zip" -d "$pkgdir/usr/lib/nijiexpose/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/nijiexpose/nijiexpose "$pkgdir/usr/bin/nijiexpose"
}

