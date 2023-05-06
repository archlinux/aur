# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=deeplx-bin
pkgver=0.7.8
pkgrel=1
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
source=('https://raw.githubusercontent.com/OwO-Network/DeepLX/main/deeplx.service'
https://raw.githubusercontent.com/OwO-Network/DeepLX/main/LICENSE
)
source_x86_64=("deeplx-x86_64-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_amd64")
source_aarch64=("deeplx-aarch64-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_arm64")
source_i686=("deeplx-i686-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_386")
source_mips=("deeplx-mips-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_mips")
noextract=()
sha256sums=('4254690f52328eeb9f4c7a83485947ca024d66d6358b1cc3bf9554c8d870d434'
            '07d8087d9d722927de7a76beea85fae9f23348ce410aea1daf9159bdc7ae76c7')
sha256sums_x86_64=('cbc55f26915b1aacd970377b4565faa7befe288ab8f0760687c6e16cbb186557')
sha256sums_i686=('499d2fd32a8a5cd8ee89e0cfa110e82058876e34496b2e654ff0051b0688accd')
sha256sums_aarch64=('3775b402ed478be8e29cb64a0a56824a9c6c918433075a5313d1f989911a4d67')
sha256sums_mips=('dd2543cd5bf7a46c9ec613961999b09fe3d2153fa79f8cf7d00b5d340416549c')
validpgpkeys=()


package() {
		install -Dm755 "deeplx-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/deeplx"
		install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
		install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
