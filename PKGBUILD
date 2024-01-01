# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asukaminato <i at asukaminato dot eu dot org>
pkgname=deeplx-bin
pkgver=0.8.8
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
sha256sums_x86_64=('b4bad50b8a477a3d50c3d6a303af03be1d52cf78140851a909caed92d8681685')
sha256sums_i686=('26a119095709f3ef19d7a52a5cead0d8c568f4b9c3016c531833d36f5df49f72')
sha256sums_aarch64=('dda3e4c21265085c1cd2fdbeb5a46737a8133e9ae9930ccb8d3129d03ffcbf8e')
sha256sums_mips=('abffa1209aaaf6508b255cf5f12cd200d0291535d42d70cbe0d83cb66468ddcb')

package() {
	install -Dm755 "deeplx-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/deeplx"
	install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
