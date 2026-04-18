# Maintainer: Yaj <yajtpg@gmail.com>

pkgname=legendary-heroic-bin
pkgver=0.20.42
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
sha256sums_x86_64=('16ba3371f712bcef9765bfdc59423bc311029450ba59038a67f18e510189b5af')
sha256sums_aarch64=('7dac82d2cb8a5801823417e71f69fe8f884b6c61875922aac1b66d7443b2143a')

package() {
     if [[ "$CARCH" == "x86_64" ]]; then
       install -Dm755 "${srcdir}/legendary_linux_x86_64" "${pkgdir}/usr/bin/legendary"
     elif [[ "$CARCH" == "aarch64" ]]; then
       install -Dm755 "${srcdir}/legendary_linux_arm64" "${pkgdir}/usr/bin/legendary"
     fi
}