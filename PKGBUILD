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
			'c7a4381585a479a3e27601f32c665b4d6a5a6825ceb9ed153ac5b67614e9afce5c855f5c94f77c4afbadcf6a941dde85683d628c573b059940030298484955a3'
            '96c157b2ae2b418efddb58fd88e53ae9724e94fa9023f1979bd412f1a69e0d472b081ba83aa84c67907e1a4c9bd2a396b386f361b9c6a4de97b0fe6468f1005f')

#backup=("etc/conf.d/${_pkgname}/default.conf")

package() {
    install -Dm755 "${srcdir}/tshock.sh" "${pkgdir}/usr/bin/tshock"

    # Unzip server files
    install -d "${pkgdir}/usr/lib/tshock"
    bsdtar -x -f "${srcdir}/${_pkgname}_${pkgver}.zip" -C "${pkgdir}/usr/lib/tshock"
}
