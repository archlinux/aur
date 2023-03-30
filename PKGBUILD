# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhuangzhuang <xufengyuan20080802@outlook.com>
_pkgname=rubick
pkgname="${_pkgname}-bin"
pkgver=2.1.6
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
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
	"LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('01cd88b72b13209365b160d1420edf4fb4911ad127b56557649b8a42adfd634b'
            '98ec3482acc93db8661b6a794744e5eaca088cf75312d15f196abb5db7e52b77')

package(){
	bsdtar -xf data.tar.xz -C "${pkgdir}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}