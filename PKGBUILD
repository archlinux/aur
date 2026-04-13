# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=dreampotato-bin
_pkgname=DreamPotato
pkgver=0.3.0
pkgrel=1
pkgdesc='An emulator for the Dreamcast VMU'
url='https://github.com/RikkiGibson/DreamPotato'
arch=("x86_64")
license=("MIT")
depends=()
source=(
    "$url/releases/download/v$pkgver/DreamPotato-Linux-x64-v$pkgver.zip"
    "dreampotato.desktop"
)
sha256sums=(
    '8752244e187e89fc4cb9577c8e7c022e43bb04a48694fbc0e084db66df1ac5f2'
    '274b696ef5ee780082ff5e0e3743aee11e8ea4d14a2c4abea491b68c0c4ce1bd'
)
provides=("dreampotato")
options=("!strip")

package() {
    cd $srcdir

    install -Dm755 DreamPotato-linux-x64.AppImage $pkgdir/usr/bin/DreamPotato
    install -Dm644 dreampotato.desktop -t $pkgdir/usr/share/applications
}
