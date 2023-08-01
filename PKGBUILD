# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asukaminato <i at asukaminato dot eu dot org>
pkgname=deeplx-bin
pkgver=0.8.0
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
sha256sums_x86_64=('c68473b5e9364db8e765983454c66d7db3c7b500a0bd4a34226839eef6b0c5ba')
sha256sums_i686=('3c6e5c43154d92ec4defc879411a75feae5291888dd524b3b2ff2c605cd115a0')
sha256sums_aarch64=('61d5b01edd96d86c1ce4029b91be0c1de4794b7fef5dbe21860069e5e4718027')
sha256sums_mips=('8bd4c49d72c0f5456b6a80f1325e05c3331d0aebce1a93e50dabefa7d76d1285')

package() {
	install -Dm755 "deeplx-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/deeplx"
	install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
