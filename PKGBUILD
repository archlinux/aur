# Maintainer: taotieren <admin@taotieren.com>

pkgname=esdk-settings-generator
pkgver=20.08.00.00
pkgrel=2
epoch=
pkgdesc="This is a python tool based on pydevicetree (GitHub/PyPI) which generates the settings.mk files for freedom-e-sdk."
arch=('any')
url="https://github.com/sifive/esdk-settings-generator"
license=('Apache-2.0')
groups=()
depends=(
    sh
    python
    python-pylint
    python-pydevicetree
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('e356ceaab461564dbe289897942c2e323ee35b38d018b48859db6d70736c15df')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/sifive/${pkgname}" \
        "${pkgdir}/usr/bin"

    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -r $(ls -d */) "${pkgdir}/usr/share/sifive/${pkgname}"
    cp -r generate_settings.py "${pkgdir}/usr/share/sifive/${pkgname}"
    ln -sf "/usr/share/sifive/${pkgname}/generate_settings.py" "${pkgdir}/usr/bin/${pkgname}"
}
