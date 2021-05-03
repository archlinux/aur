# Maintainer: jackreeds
pkgname_orig=neovide
pkgname=${pkgname_orig}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple GUI for Neovim (prebuilt)"
arch=('x86_64')
url="https://github.com/Kethku/neovide"
license=('MIT')
depends=('neovim' 'fontconfig' 'freetype2' 'libglvnd' 'sndio')
optdepends=(
    'vulkan-intel: Vulkan support for Intel GPUs'
    'vulkan-radeon: Vulkan support for AMD Radeon GPUs')
conflicts=('neovide' 'neovide-git')
binname=${pkgname_orig}-${pkgver}-${pkgrel}
source_x86_64=(
	"${binname}::${url}/releases/download/${pkgver}/${pkgname_orig}"
)
sha512sums_x86_64=(
	'7040cf19faf0fdd7d0b0c354f6e07bbf41a1b3007022bbb80a30dda7d5ee79bda0c64a653017d3f8aa5d4b29455f4874fcca4924f02f35cd3b35e00cf62dadd3'
)

package(){
	install -Dm755 "${binname}" "$pkgdir/usr/bin/${pkgname_orig}"
}
