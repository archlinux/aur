# Maintainer: sg

pkgname=pacgui
pkgver=0.8
pkgrel=2
pkgdesc="System updates with a simple pacman GUI"
arch=('any')
license=('GPLv3')
install=${pkgname}.install
depends=('zenity' 'pacman-contrib')
source=(${pkgname}.sh
		${pkgname}.desktop
		${pkgname}.service
		${pkgname}.timer)
sha256sums=('adfc19b244b30437b57e45a973ee3f2e3752a077eceaf219fe9c190b12dadc81'
            '18bb664c2365cd9335672e8bcadf89a12a6a017941e6fd133259c52b5dbf05db'
            '958385268a24ae5dee8d8e963efa0ecb9f55d4e36bb30f1c5a66bd97e24d33df'
            '893b87984d9ae8ab9409d1800f8e75fc70ebd869d1a26b37e05598d310065023')
 

package()
{
	install -m755 -D ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}.sh
	install -m644 -D ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
	install -m644 -D ${srcdir}/${pkgname}.timer ${pkgdir}/usr/lib/systemd/user/${pkgname}.timer
	install -m644 -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
