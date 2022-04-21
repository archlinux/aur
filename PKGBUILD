# Maintainer: Stezko <stezko@gmail.com>
pkgname=gnome-connection-manager-bin
_pkgname=gnome-connection-manager
pkgver=1.2.1
pkgrel=3
pkgdesc="Simple tabbed ssh and telnet connection manager for GTK+ environments."
arch=('any')
url="http://kuthulu.com/gcm"
license=('GPLv3')
groups=('')
depends=('expect' 'gobject-introspection' 'python' 'python-gobject')
options=('!strip' '!emptydirs')
install=${pkgname%-bin}.install
source=(https://github.com/kuthulux/gnome-connection-manager/releases/download/v${pkgver}/gnome-connection-manager_${pkgver}_all.deb)
sha512sums=('0487cafda21d2a277ae2bf234a4d758c710e35b75eae2fffdef1d01ae19046bef0de13f4cde05c23f7d03d847a5548fb4ad5e0ae554a13f32a057d93feac8610')

package(){
	tar xzf data.tar.gz -C "${pkgdir}"

	install -D -m644 ${pkgdir}/usr/share/doc/${_pkgname}/copyright "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	#fix css error
	touch ${pkgdir}/usr/share/gnome-connection-manager/style.css
}
