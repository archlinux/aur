# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgname="omodsim"
_pkgver=1.8.2
_subver=1
release_tag="${_pkgver}-${_subver}"
pkgver="${_pkgver}.${_subver}"
pkgrel=2
pkgdesc="Open ModSim is a Free Modbus Slave (Server) Utility"
arch=('x86_64')
url="https://github.com/sanny32/OpenModSim"
license=('MIT')
depends=('qt6-base')
optdepends=('qt6-serialport: for modbus serial port support')
source=("${url}/releases/download/${_pkgver}/qt6-${pkgname}-${release_tag}.x86_64.rpm"
        "LICENSE::https://raw.githubusercontent.com/sanny32/OpenModSim/refs/heads/main/LICENSE.md")
sha1sums=('f65549879df1c4ea706762b113b5f233eff96fd5'
          '8b5fc6c148cd0173d200a26e749aad51dcc1e5d0')

package() {
    cd ${srcdir}
    cp -r "${srcdir}/opt" "${srcdir}/usr" ${pkgdir}

    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/OpenModSim/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
