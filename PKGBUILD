# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asukaminato <i at asukaminato dot eu dot org>
pkgname=deeplx-bin
pkgver=0.7.9
pkgrel=1
pkgdesc="Permanently free DeepL API written in Golang"
arch=('x86_64' 'i686' 'aarch64' 'mips')
url="https://github.com/OwO-Network/DeepLX"
license=('MIT')
provides=('deeplx')
install=${pkgname}.install
source=('https://raw.githubusercontent.com/OwO-Network/DeepLX/main/deeplx.service'
	https://raw.githubusercontent.com/OwO-Network/DeepLX/main/LICENSE
)
source_x86_64=("deeplx-x86_64-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_amd64")
source_aarch64=("deeplx-aarch64-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_arm64")
source_i686=("deeplx-i686-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_386")
source_mips=("deeplx-mips-${pkgver}::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_mips")
sha256sums=('4254690f52328eeb9f4c7a83485947ca024d66d6358b1cc3bf9554c8d870d434'
            '07d8087d9d722927de7a76beea85fae9f23348ce410aea1daf9159bdc7ae76c7')
sha256sums_x86_64=('a012e59ac12d835f51679bbb279a0527cea763cc7a10c674fc1cf0a5ac85db5f')
sha256sums_i686=('83de35159aef440ff52c16af9d743329b26a3df058a8af131f97a345ec984c43')
sha256sums_aarch64=('1fd62c3c6686b24be2deb550781a8cf56beada789ba1877425b8aafbb0171db5')
sha256sums_mips=('ea8d36fc6575eda9c10cb4091114e2d5c4a128a8091eeb4d9cf585158653ee0b')

package() {
	install -Dm755 "deeplx-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/deeplx"
	install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
