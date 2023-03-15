# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=deeplx-bin
pkgver=0.7.6
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
sha256sums_x86_64=('6df0ed0a84b17d661b1d6518157f7062cd61b67515ed1c132adee812299befd5')
sha256sums_i686=('4e77972c94ee2a9d4c2d6d0cd5d81f478589c07bd8dc51fdabb51738dcd32e83')
sha256sums_aarch64=('d6f64c841789e50fc641d5b3cec309d6957d33d88d8a81479ff21c95eb343688')
sha256sums_mips=('8a4dbe4c3938613c91d72f47f60c229849baf0cd5c2f710b57734e711fb9a163')
validpgpkeys=()


package() {
		install -Dm755 "deeplx-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/deeplx"
		install -Dm644 deeplx.service -t "${pkgdir}/etc/systemd/system/"
		install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
