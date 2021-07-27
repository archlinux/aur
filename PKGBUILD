# Maintainer: taotieren <admin@taotieren.com>

pkgname=esdk-settings-generator
pkgver=20.05.RC.01
pkgrel=1
epoch=
pkgdesc="This is a python tool based on pydevicetree (GitHub/PyPI) which generates the settings.mk files for freedom-e-sdk."
arch=('any')
url="https://github.com/sifive/esdk-settings-generator"
license=('Apache')
groups=()
depends=('python' 'python-pylint' 'python-pydevicetree')
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
source=("${pkgname}-${pkgver}.tar.gz::https://download.fastgit.org/sifive/esdk-settings-generator/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('fce2a625768375820583176c898a1349e69d0065b9b3b3e4e222af7084cce989')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/sifive/${pkgname}" \
                    "${pkgdir}/usr/bin"

    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -r `ls -d */` "${pkgdir}/usr/share/sifive/${pkgname}"
    cp -r generate_settings.py "${pkgdir}/usr/share/sifive/${pkgname}"
    ln -sf "/usr/share/sifive/${pkgname}/generate_settings.py" "${pkgdir}/usr/bin/${pkgname}"
}
