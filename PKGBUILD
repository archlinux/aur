# Maintainer: taotieren <admin@taotieren.com>

pkgname=devicetree-overlay-generator
pkgver=20.05.RC.03
pkgrel=1
epoch=
pkgdesc="This is a python tool based on pydevicetree (GitHub/PyPI) which generates OpenOCD Configuration Files for Freedom Metal applications."
arch=('any')
url="https://github.com/sifive/devicetree-overlay-generator"
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
source=("${pkgname}-${pkgver}.tar.gz::https://download.fastgit.org/sifive/devicetree-overlay-generator/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('f822cd4e65f1907e313bc15ddc52b851490ff13c648bb50718902dc654a7bc6e')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/sifive/${pkgname}" \
                    "${pkgdir}/usr/bin"

    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -r `ls -d */` "${pkgdir}/usr/share/sifive/${pkgname}"
    cp -r generate_overlay.py "${pkgdir}/usr/share/sifive/${pkgname}"
    ln -sf "/usr/share/sifive/${pkgname}/generate_overlay.py" "${pkgdir}/usr/bin/${pkgname}"
}
