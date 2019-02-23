# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=openttd-openmsx
pkgver=0.3.1
pkgrel=3
pkgdesc="Free music set for openttd"
arch=('any')
url="http://www.openttd.org"
license=('GPL')
source=(http://bundles.openttdcoop.org/openmsx/releases/${pkgver}/openmsx-${pkgver}.zip)
md5sums=('858b79d44aea6de5e15d9d1439e86cc3')
depends=(timidity++ freepats-general-midi)

build() {
    cd "${srcdir}/openmsx-${pkgver}"

    chmod 0644 * || return 1
}

package() {
    cd "${srcdir}/openmsx-${pkgver}"

    mkdir -pm0755 ${pkgdir}/usr/share/openttd/gm
    cp openmsx.* ${pkgdir}/usr/share/openttd/gm/ || return 1
    cp *.mid ${pkgdir}/usr/share/openttd/gm/ || return 1
}

# vim:set ts=2 sw=2 et:
