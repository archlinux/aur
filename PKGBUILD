# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nuclei-dlink-bin
pkgname=nuclei-dlink-bin
_name=dlink_firmware-gd32vf103c_dlink
pkgver=0.9.1
pkgrel=1
arch=(any)
options=(!strip !debug)
depends=()
makedepends=(unzip)
optdepends=('nuclei-dlink-gdbserver: Nuclei DLink GDB Server Tool')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
pkgdesc="DLink: RISC-V Debugger Firmware based on rvlink"
license=('MulanPSL-1.0')
url="https://github.com/Nuclei-Software/nuclei-dlink"
source=("${_name}-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${_name}-v${pkgver}.zip")
sha256sums=('51bb7b5f88dd87a131433477c9468cb3df98044792fb10249cbd504e4eee0fdb')
noextract=("${_name}-v${pkgver}.zip")

package() {
    install -dvm644 ${pkgdir}/opt/nuclei/${pkgname%-bin}/${_name}
    unzip "${srcdir}/${_name}-v${pkgver}.zip" -d "${pkgdir}/opt/nuclei/${pkgname%-bin}/${_name}"

    chown -R root:root "${pkgdir}"
}
