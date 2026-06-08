
pkgname=nijiexpose-bin
pkgver=v1.0.0beta2
_githubrel=v1.0.0-beta2
pkgrel=1
pkgdesc="Application that allows streaming with nijilive puppets (VTuber, fork of Inochi2D which is like Live2D)"
arch=('x86_64')
url=''
license=('BSD-2-Clause')
provides=('nijiexpose')
makedepends=(unzip)
depends=(dbus freetype2 gcc-libs sdl2 glibc)
source=(
	"nijiexpose-linux-x86_64-$pkgver.zip::https://github.com/nijigenerate/nijiexpose/releases/download/$_githubrel/nijiexpose-linux-x86_64.zip"
	"nijiexpose.desktop"
)

sha256sums=('edb244c8998a200789dc0f316932b3375c91f851eff5b289d77cad09edc91671'
            'b30a05243e75d4b3c7abec704fcf3aa399f6a335f137f9c13117f066868237f4')

package() {

    install -Dm644 "nijiexpose.desktop" "$pkgdir/usr/share/applications/nijiexpose.desktop"

    mkdir -p "$pkgdir/usr/lib/nijiexpose"
    unzip "nijiexpose-linux-x86_64-$pkgver.zip" -d "$pkgdir/usr/lib/nijiexpose/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/nijiexpose/nijiexpose "$pkgdir/usr/bin/nijiexpose"
}

