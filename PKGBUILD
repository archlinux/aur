# Maintainer: hellopoisonx<x1665341912@gmail.com>
# Contributor: BryanLiang <liangrui.ch at gmail dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=subconverter-bin
_pkgname=subconverter
pkgver=0.9.0
pkgrel=3
pkgdesc='Utility to convert between various proxy subscription formats (Precompiled version)'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/tindy2013/subconverter"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('bash')
install=subconverter.install

source_x86_64=("${_pkgname}-${pkgver}_linux64.tar.gz::${url}/releases/download/v${pkgver}/subconverter_linux64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/subconverter_aarch64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}_armv7h.tar.gz::${url}/releases/download/v${pkgver}/subconverter_armv7.tar.gz")
source=("${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.sh")

sha256sums_x86_64=('884a6d1168267eba076fcdd5171215bacf98c17948ab526e4cbbdcad5f7a0217')
sha256sums_aarch64=('0914688a0af211360271a4eef8a731f09852b47edf094d3758070b660544659e')
sha256sums_armv7h=('fd1e6f41616be6948fd988b46c3de81ac7c70bf7470d9b029f9e163c86cdb50f')
sha256sums=('453249c76ca32f5dbbb913e9026fe4e6132b250f59551ccf34442d579bcf7df4'
            '5aeb6a6323aad298db570249db2a77ba4f951ac977194d17adadd5e103604bf5'
            'c7b66bf3efd0b088d6ccd79ecd779fe2f693bffeb4b8e85d836150f478280202')

package() {
    install -dm 755 "${pkgdir}/opt/${_pkgname}"
    cp -aR "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/${_pkgname}"
    install -Dm 755 "${srcdir}/${_pkgname}.sh"       "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "${srcdir}/${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm 644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}

# vim:set ts=4 sw=4 et:
