# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='midnight-rescue'
pkgver=1.0
pkgrel=3
pkgdesc='A classic educational game from Abandonia, played in DosBox'
url='https://www.myabandonware.com/game/super-solvers-midnight-rescue-1r5'
arch=('any')
license=('custom-freeware' 'Abandonware')
depends=('dosbox' 'unionfs-fuse')
source=('Midnight_Rescue.zip::http://files.abandonia.com/download.php?game=Super+Solvers+-+Midnight+Rescue&secure=da2b471ea49d5a02e5b2a87e4f8e34e5&td=1549091612'
        ${pkgname}.{sh,desktop,png})
sha256sums=('51a095a8093f549a653a67fc810d9cb385b0f81b8d1c2e0c8cf7fca0adc363c6'
            '514e0d3e0443569cfcdfd6660ebd4944aa8c62bd7795f45aa280714c1205d0eb'
            'a596dbf056cf9e28d8c6a050667717d4d37f662206f02329c42b78aea963edbf'
            '5ee1dc824f4012952337fe2b4fdfc5bef140a3117fb4279b3454f91400b5d484')

package() {
	install -dm755 "${pkgdir}"/opt/abandonia/${pkgname}
	cp -ar SSR/* "${pkgdir}"/opt/abandonia/${pkgname}

	install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
	install -Dm644 ${pkgname}.png -t "${pkgdir}"/usr/share/pixmaps/
	install -Dm644 ${pkgname}.desktop -t "${pkgdir}"/usr/share/applications/
}
