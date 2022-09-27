# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=openttd-openmsx
pkgver=0.4.2
pkgrel=1
pkgdesc="Free music set for openttd"
arch=('any')
url="http://www.openttd.org"
license=('GPL')
source=("https://cdn.openttd.org/openmsx-releases/${pkgver}/openmsx-${pkgver}-all.zip")
sha256sums=('5a4277a2e62d87f2952ea5020dc20fb2f6ffafdccf9913fbf35ad45ee30ec762')
depends=(timidity++ freepats-general-midi)

prepare() {
    bsdtar -xf openmsx-${pkgver}.tar
}

package() {
    cd "openmsx-${pkgver}"

    install -Dm644 openmsx.* -t "${pkgdir}/usr/share/openttd/gm/"
    install -Dm644 *.mid -t "${pkgdir}/usr/share/openttd/gm/"
}

# vim:set ts=2 sw=2 et:
