# Maintainer: Donien <donien.96@hotmail.com>

pkgname="icingaweb2-module-fileshipper"
pkgver="1.2.0"
pkgrel=1
epoch=0
pkgdesc="Provide CSV, JSON, XML and YAML files as an Import Source for the Icinga Director"
arch=("any")
url="https://github.com/Icinga/icingaweb2-module-fileshipper"
license=("GPL")
groups=()
depends=(
    "icingaweb2-module-director>=1.1.0"
)
makedepends=()
optdepends=()
provides=("icingaweb2-module-fileshipper")
conflicts=()
replaces=()
backup=(
    "etc/icingaweb2/modules/fileshipper/imports.ini"
    "etc/icingaweb2/modules/fileshipper/directories.ini"
)
options=()
install="icingaweb2-module-fileshipper.install"
changelog=
source=(
    "https://github.com/Icinga/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "imports.ini"
    "directories.ini"
)
noextract=()
sha256sums=(
    "1a8d59e4dc3164d5fb647a0253d24b35e3dda1f612a323648ca93d1033dbd9a7"
    "SKIP"
    "SKIP"
)



package() {
    install -dm770                "${pkgdir}/etc/icingaweb2/modules/fileshipper"
    install -m660 imports.ini     "${pkgdir}/etc/icingaweb2/modules/fileshipper/imports.ini"
    install -m660 directories.ini "${pkgdir}/etc/icingaweb2/modules/fileshipper/directories.ini"
    chmod 2770 "$pkgdir/etc/icingaweb2"

    install -dm755 "${pkgdir}/usr/share/webapps/icingaweb2/modules/fileshipper/"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/usr/share/webapps/icingaweb2/modules/fileshipper/"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/icingaweb2-module-fileshipper/LICENSE"
}
