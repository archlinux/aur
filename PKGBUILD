# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-tomte
pkgver=2.0.14
pkgrel=1
pkgdesc="little helper that provides services, updates and fixes for TUXEDO devices"
arch=(any)
url="https://tuxedocomputers.com"
license=('GPL3')
install=${pkgname}.install

source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/${pkgname}/${pkgname}_${pkgver}_all.deb ${pkgname}.install)
sha256sums=('94d131355d05d489b4ec3ced052999d0d67b6379b92935e41519a5b77f2131fa'
            '6f62bb32139f92564cfe3341c4f3a6fb42b01b04ad658b3046f038726981208e')
sha512sums=('bf52a33b8f0bb4688f757a564c549d657d1f05c01db2cac41391e1648c2dea50aac1213dbbc8f737a2e2ede849149882849545d9e688a418b8d87e362e35400b'
            'd9a1084dfe0e783c660987824eec91af90d7a94ca9e467073477f2a38e4b8b0cc3372967e893e15706c67d559c288c2e61671fa0844ff7dce0f3a5841ba975c2')

package() {
 echo "Unfortunately no package exists for Parse::EDID"
 echo "So you have to install it manually. Please follow the installation instructions" 
 echo "https://metacpan.org/pod/Parse::EDID"
 sleep 10
 mkdir -p "${pkgdir}/etc/tomte/"
 mkdir -p "${pkgdir}/usr/bin/"
 mkdir -p "${pkgdir}/etc/systemd/system/"
 tar -xf "${srcdir}/data.tar.xz"
 cp -av etc "${pkgdir}"
 cp -av lib "${pkgdir}/etc/"
 cp -av usr "${pkgdir}"
 install -Dm644 "${srcdir}/etc/tomte/tomte.cfg" "${pkgdir}/etc/tomte/tomte.cfg"
 install -Dm644 "${srcdir}/lib/systemd/system/tuxedo-tomte.service" "${pkgdir}/etc/systemd/system/tuxedo-tomte.service"
 install -Dm644 "${srcdir}/lib/systemd/system/tuxedo-tomte.timer" "${pkgdir}/etc/systemd/system/tuxedo-tomte.timer"
 install -Dm755 "${srcdir}/usr/bin/tuxedo-tomte" "${pkgdir}/usr/bin/tuxedo-tomte"
}

