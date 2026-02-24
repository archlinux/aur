# Maintainer: SummerBreeze630 <xzwf2003@163.com>

pkgname=bili23-downloader
pkgver=1.70.4
pkgrel=1
pkgdesc="Bili23 Downloader"
arch=('x86_64')
url="https://bili23.scott-sloan.cn/"
license=('MIT')
depends=('libtiff5' 'ffmpeg')
provides=()
options=('!strip')
_git_url="https://github.com/ScottSloan/Bili23-Downloader"
source=("${_git_url}/releases/download/v${pkgver}/Bili23_Downloader-${pkgver}-linux-amd64.deb"
	"https://raw.githubusercontent.com/ScottSloan/Bili23-Downloader/main/LICENSE"

)
sha256sums=('c668fb5a97d95c5a63a4d95fc50565e06e98bcb50f2596d692cd95f1895a54d4'
	'fb83d13261630aae26b4c7a9ab6366d8de205a7715995670d3a4285ae0550764'
)

package() {
	tar -axvf data.tar.zst
	cp -r opt ${pkgdir}
	cp -r usr ${pkgdir}

	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
