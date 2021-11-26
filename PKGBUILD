# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>

_pkgname=tshock
pkgname=${_pkgname}-bin
pkgver=4.5.9
# Because of tag 4.2200 is 4.2.2.1228 and tag 4.2202 is 4.2.2.0224 epoch must be 1
epoch=1
pkgrel=1
pkgdesc="A Terraria Server administration modification that runs on the open source TerrariaAPI."
arch=(any)
url="http://tshock.co/xf"
license=("GPL3")
depends=("mono")
provides=($_pkgname)
conflicts=($_pkgname)
#install="${pkgname}.install"
source=("${_pkgname}_${pkgver}.zip::https://github.com/Pryaxis/TShock/releases/download/v4.5.9/TShock4.5.9_Terraria.1.4.3.2.zip"
		'tshock-bin.install'
        'tshock.sh')
noextract=("${_pkgname}_${pkgver}.zip")
sha512sums=('495a40ff1b27436d39e983c57987a22bf747aff7d7561b24dce675d855a1306e8204cfb0f68547a665ef157995e71b93260617f07e383ae444e69b2027fcde02'
			'ae90ff11842c93a12d5e84b5090731e0194280d5e598d54695dec6d9496e5d2f8d363a8b894e12343583df97ff904a10f008e9b13854cc1c555f65b100a8cadb'
            'f0958448b53ff9851c47876b89f1cef6d3e33ce1b8cbe13167c685ed1c9d89a8bf0f01929d47200e4f0f964c3e7796a2d9ca558e5d9f1269db3f2e4537a6c97a')

#backup=("etc/conf.d/${_pkgname}/default.conf")

package() {
    install -Dm755 "${srcdir}/tshock.sh" "${pkgdir}/usr/bin/tshock"

    # Unzip server files
    install -d "${pkgdir}/usr/lib/tshock"
    bsdtar -x -f "${srcdir}/${_pkgname}_${pkgver}.zip" -C "${pkgdir}/usr/lib/tshock"
}
