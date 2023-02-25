# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=deeplx-bin
pkgver=0.7.3
pkgrel=2
pkgdesc="Permanently free DeepL API written in Golang"
arch=('x86_64' 'i686' 'aarch64' 'mips')
url="https://github.com/OwO-Network/DeepLX"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('deeplx')
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
source=('https://raw.githubusercontent.com/OwO-Network/DeepLX/main/deeplx.service')
source_x86_64=("deeplx-x86_64-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_amd64")
source_aarch64=("deeplx-aarch64-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_arm64")
source_i686=("deeplx-i686-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_386")
source_mips=("deeplx-mips-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_mips")
noextract=()
sha256sums=('4254690f52328eeb9f4c7a83485947ca024d66d6358b1cc3bf9554c8d870d434')
sha256sums_x86_64=('e4a9bb2c479b703ae3c7685e0a13bbdb1b5762478528ce5d72719a19010326f4')
sha256sums_i686=('a8d7b517145fb341e71bc6de3f24fdd4222b18f2f6464618adc52a1a5d185212')
sha256sums_aarch64=('59b8c968490f42eddb102f483ad07005a2bf069fcecdf47a0ed9acdde0527706')
sha256sums_mips=('9255be34e5b7f7a26205cabc85013c89ee7cf98f828de497637fdc5b0a4ad1f2')
validpgpkeys=()


package() {
		install -Dm755 "deeplx-${CARCH}-${pkgver}" ${pkgdir}/usr/bin/deeplx
		install -Dm644 deeplx.service -t ${pkgdir}/etc/systemd/system/
}
