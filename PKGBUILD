# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asukaminato <i at asukaminato dot eu dot org>
pkgname=deeplx-bin
pkgver=0.8.9
pkgrel=1
pkgdesc="Permanently free DeepL API written in Golang"
arch=('x86_64' 'i686' 'aarch64' 'mips')
conlicts=('deeplx')
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
sha256sums_x86_64=('8dfe0073d84f0d5bbcd130ae9cf06485c74246a8e9b2b96e2374d413b90a4177')
sha256sums_i686=('d332efeb6ec0928b4709b3752e271866eb4f70936da2936618372b3cc5b5c83a')
sha256sums_aarch64=('f7c9df4cd64d63d108c2a238183e1404e172f2b6e525600272db4256118bc5d3')
sha256sums_mips=('5f633045d96a65a76dae0576e14af86326bb8963aabff914a931443c77260f4b')

package() {
	install -Dm755 "deeplx-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/deeplx"
	install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
