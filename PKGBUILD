# Maintainer: Geequlim <geequlim at gmail dot com>

pkgname=voxspell-bin
pkgver=0.1.9
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
sha256sums=('7db6f049c68096494e0c4ee2d7c6df6d3aee95b129e16c2269046b7c40e39b6a')

package() {
	cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
	mv "${pkgdir}/usr/share/licenses/voxspell" "${pkgdir}/usr/share/licenses/${pkgname}"
}
