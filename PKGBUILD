# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i386' 'i486' 'i586' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=57')
optdepends=('upx: compress binary')
provides=('browsh')
conflicts=('browsh' 'browsh-git')
options=('!strip')
source_x86_64=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_amd64")
source_i386=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_386")
source_i486=($source_i386)
source_i586=($source_i386)
source_i686=($source_i386)
source_armv6h=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_arm64")

prepare() {
	cat ${provides[0]}_${pkgver}_linux_* > ${provides[0]}
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${provides[0]} with UPX...
		chmod u+x ${provides[0]}
		upx --best ${provides[0]}; fi
}

package() {
	install -Dm755 ${provides[0]} "$pkgdir/usr/bin/${provides[0]}"
}

sha512sums_x86_64=('44431c0d859254baa141737518b374129aa8d632cb00c589047dca615a11b07195e4ae718f9bd8b338d43b6648da26774178d7a942f1ca1809508e990ecb7182')
sha512sums_i386=('3dea0f7b50f5eec33a644966f4151515eda0472e5f1f2a66172d30a07c4c7d9fb7caea19a6c1258c448fb21c814d51f904f6e1d609ebc8d5401fc7328ae9240a')
sha512sums_i486=('3dea0f7b50f5eec33a644966f4151515eda0472e5f1f2a66172d30a07c4c7d9fb7caea19a6c1258c448fb21c814d51f904f6e1d609ebc8d5401fc7328ae9240a')
sha512sums_i586=('3dea0f7b50f5eec33a644966f4151515eda0472e5f1f2a66172d30a07c4c7d9fb7caea19a6c1258c448fb21c814d51f904f6e1d609ebc8d5401fc7328ae9240a')
sha512sums_i686=('3dea0f7b50f5eec33a644966f4151515eda0472e5f1f2a66172d30a07c4c7d9fb7caea19a6c1258c448fb21c814d51f904f6e1d609ebc8d5401fc7328ae9240a')
sha512sums_armv6h=('fbb36976c2be87a941771eb01fee2c00c0d69c9582eafc296848cc82a6a6385e6d9ec542f4f9c865f23e21505efe9409bc64047b99acd3aec382faf3bbf35959')
sha512sums_armv7h=('419bbdb4877818d9af905224f5305e6dede4ad2a0fbc0d5f2ed2b0ff121f8168b7868fbb345f2a9de4eb03b018c7796694cff64adcf30e8e81e14056239dd670')
sha512sums_aarch64=('9f7e321008290afd4ed8212529cdc6b5c6b51c61b44831a56aae3ebf0519111c51b913b3395ebba6d3b3e23c3d954ed1f24bc9b7ae5f77f8a6ed5e5f0fa509f3')
