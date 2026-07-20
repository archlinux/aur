# Maintainer: Geequlim <geequlim at gmail dot com>

pkgname=voxspell-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='言出法随——面向 Fcitx 5 的 AI 语音输入工具（二进制版）'
arch=('x86_64')
url='https://github.com/Geequlim/VoxSpell'
license=('PolyForm-Noncommercial-1.0.0')
depends=(
	'cairo'
	'fcitx5>=5.1.0'
	'fcitx5-rime'
	'gobject-introspection-runtime'
	'gtk4'
	'libadwaita'
	'pipewire-audio'
)
provides=('voxspell')
conflicts=('voxspell')
install='voxspell-bin.install'
source=("https://github.com/Geequlim/VoxSpell/releases/download/v${pkgver}/voxspell-${pkgver}-linux-${CARCH}.tar.zst")
sha256sums=('eafb1ed39d2bfddc9303bdadb227c14204a822668ce3385536046beec325e48d')

package() {
	cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
	mv "${pkgdir}/usr/share/licenses/voxspell" "${pkgdir}/usr/share/licenses/${pkgname}"
}
