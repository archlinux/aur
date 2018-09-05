# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=vv-bin
pkgver=1.4.0
pkgrel=2
pkgdesc='Image viewer for 2D, 2D+t, 3D and 3D+t (or 4D) images'
arch=('x86_64')
url='https://www.creatis.insa-lyon.fr/rio/vv/'
license=('BSD')
depends=()
optdepends=()
provides=('vv')
conflicts=('vv' 'vv-git')
makedepends=()
source=("vv-1.4Qt4-linux64.tar.gz::https://www.creatis.insa-lyon.fr/rio/vv?action=AttachFile&do=get&target=vv-1.4Qt4-linux64.tar.gz"
        "https://raw.githubusercontent.com/open-vv/vv/master/vv/icons/ducky.png"
		"vv.desktop"
		"https://raw.githubusercontent.com/open-vv/vv/master/LICENSE.txt")
sha512sums=('ad31906a693c618d26224e6c0425392af2b8931989cfc13eb75a5954ee96fc05f1a6adc7ca889aeb47800cb88bbcc8f5f08532503d993256320f403dee93dd07'
            '92e9ab4b3bd601c01879f32c2a9358e295c554c9a4c9f47baa37a4cf6b6c9cc693881de5ef0658979a79779bd063849cef9aec0d7851dac01d2eff6cfffeba16'
            '4503163703e2043ae72b3a537792e3d1f169f7c3ebba15dba85132cd7f921a8a82f559127894a35b4b96a469a886c20d46e2b6022a18089afabc6f4283743d58'
            '5927251753dc1ccd570be874e18429b3206388b42a224c1d0b0674a3cf98ae1c7963797252b347718b39913560db83035f88da562d338485cdee2b2dd7ee9d14')

package() {
	install -d "${pkgdir}/opt/vv"
	install -D -m755 "${srcdir}"/clitk* "${pkgdir}/opt/vv"
	install -D -m755 "${srcdir}"/vv "${pkgdir}/opt/vv/vv"
	install -D -m644 \
		"${srcdir}/ducky.png" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps/vv.png"
	install -D -m755 \
		"${srcdir}/vv.desktop" \
		"${pkgdir}/usr/share/applications/vv.desktop"
	install -D -m644 \
		"${srcdir}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/vv/LICENSE"
}

