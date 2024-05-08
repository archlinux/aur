# Maintainer: Donien <donien.96@hotmail.com>

pkgname="icingaweb2-module-mapdatatype"
_module_name="mapDatatype"
pkgver="0.1.0"
pkgrel=1
epoch=0
pkgdesc="Location Data Type plugin for Icinga Director"
arch=("any")
url="https://github.com/nbuchwitz/icingaweb2-module-mapdatatype"
license=("GPL-2.0-only")
groups=()
depends=(
    "icingaweb2"
)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=""
changelog="mapdatatype.changelog"
source=(
    "https://github.com/nbuchwitz/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    "936f24cf4d6f040aa92e774a12959ee4cba8bdcae1fb84def1fbe38fbab1bfd0"
)



package() {
    install -dm2770 "${pkgdir}/etc/icingaweb2"
    install -dm2770 "${pkgdir}/etc/icingaweb2/modules/${_module_name}"

    install -Dm644 "${srcdir}/icingaweb2-module-${_module_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/share/webapps/icingaweb2/modules/${_module_name}/"
    for part in \
        application \
        configuration.php \
        library \
        module.info \
        public \
        run.php
    do
        cp -r "${srcdir}/icingaweb2-module-${_module_name}-${pkgver}/${part}" "${pkgdir}/usr/share/webapps/icingaweb2/modules/${_module_name}/"
    done
}
