# Maintainer: hcamp <itshuntercamp@gmail.com>
# Contributor: hu3rror <hu3rror@protonmail.com>
# Contributor: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-bin
pkgver=3.4.2
_pkgver=8515
pkgrel=1
pkgdesc='Professional writing app with focused mode and Markdown support'
arch=('x86_64')
url='https://www.tominlab.com/en/wonderpen'
license=('custom')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=('wonderpen')
source=("https://www.tominlab.com/to/get-file/cdn?file=WonderPen/desktop/${pkgver%.*}/WonderPen-v${pkgver}.${_pkgver}-linux-amd64.deb")
sha256sums=('0f56dd5d11593a5101d3a0c2ca63148259d05ee0f437133e1e1d276ac17a15ac')

package() {
	# Install
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	install -dm755 "${pkgdir}"/usr/bin
	ln -s /opt/WonderPen/wonderpen "${pkgdir}"/usr/bin/wonderpen
	sed -i 's|^Exec=/opt/WonderPen/wonderpen %U|Exec=wonderpen %F|g' "${pkgdir}"/usr/share/applications/WonderPen.desktop
	install -Dm 644 "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/WonderPen.png "${pkgdir}"/usr/share/pixmaps/wonderpen.png
}
