# Maintainer: Geequlim <geequlim at gmail dot com>

pkgname=agent-glow-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='面向 Linux 的硬件无关 Agent 状态灯光引擎'
arch=('x86_64')
url='https://github.com/Geequlim/agent-glow'
license=('PolyForm-Noncommercial-1.0.0')
depends=(
	'cairo'
	'gobject-introspection-runtime'
	'gtk4'
	'libadwaita'
)
optdepends=(
	'asusctl: ASUS Aura 与 Slash 硬件后端'
)
provides=('agent-glow')
conflicts=('agent-glow')
install='agent-glow-bin.install'
source=("https://github.com/Geequlim/agent-glow/releases/download/v${pkgver}/agent-glow-${pkgver}-linux-${CARCH}.tar.zst")
sha256sums=('69a2dc19fba146f40f94b64f9520a96fcb643b451e36c0d50c33cc7c8fa8859c')

package() {
	cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
	mv "${pkgdir}/usr/share/licenses/agent-glow" "${pkgdir}/usr/share/licenses/${pkgname}"
}
