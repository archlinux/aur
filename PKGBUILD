# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname="rubick-bin"
pkgver=2.2.2
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubickcenter.github.io/rubick/"
_githuburl="https://github.com/rubickCenter/rubick"
license=('MIT')
depends=('at-spi2-core' 'libxkbcommon' 'glibc' 'libxrandr' 'gcc-libs' 'glib2' 'libcups' 'libxdamage' 'libx11' 'mesa' \
	'cairo' 'libxcb' 'gdk-pixbuf2' 'gtk3' 'libxext' 'pango' 'libxcomposite' 'libxshmfence' 'libxfixes' 'libdrm' \
	'expat' 'nspr' 'nss' 'alsa-lib' 'dbus' 'hicolor-icon-theme')
optdepends=('libappindicator-gtk3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('88041de1374cd5a92411181a53f2b6298be41df6780897f602fc6d6945bab6ee'
            '98ec3482acc93db8661b6a794744e5eaca088cf75312d15f196abb5db7e52b77')

package(){
	bsdtar -xf data.tar.xz -C "${pkgdir}"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}