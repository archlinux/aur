# Maintainer: Yaj <yajtpg@gmail.com>

pkgname=legendary-heroic-bin
pkgver=0.20.43
pkgrel=1
pkgdesc="A free and open-source replacement for the Epic Games Launcher (Heroic Games Launcher fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/Heroic-Games-Launcher/legendary"
license=('GPL3')
optdepends=(
	"proton: Windows binaries support"
	"python-pywebview: Login support"
)
provides=('legendary')
conflicts=('legendary')
source_x86_64=("https://github.com/Heroic-Games-Launcher/legendary/releases/download/${pkgver}/legendary_linux_x86_64")
source_aarch64=("https://github.com/Heroic-Games-Launcher/legendary/releases/download/${pkgver}/legendary_linux_arm64")
noextract=("legendary_linux_x86_64" "legendary_linux_arm64")
sha256sums_x86_64=('2b82497051afd95670994146e6038d6e1c98a1c60c21949def668b52aef7d3f7')
sha256sums_aarch64=('e28d4bed5d7635e22093d62ed4686a4d66e9c1d8bc4f1b731f834cd16d43c86a')

package() {
     if [[ "$CARCH" == "x86_64" ]]; then
       install -Dm755 "${srcdir}/legendary_linux_x86_64" "${pkgdir}/usr/bin/legendary"
     elif [[ "$CARCH" == "aarch64" ]]; then
       install -Dm755 "${srcdir}/legendary_linux_arm64" "${pkgdir}/usr/bin/legendary"
     fi
}