# Maintainer: yifwon <wyf9661 at gmail dot com>
_pkgname=zeronews
pkgname=${_pkgname}-bin
pkgver=1.3.12
pkgrel=1
pkgdesc="ZeroNews 是一个创新的边缘云内网穿透平台"
arch=('x86_64' 'aarch64')
url="http://www.zeronews.cc"
_downloadurl="http://download.zeronews.cc"
license=('custom')
depends=('systemd')
backup=("etc/${_pkgname}/tcc.toml")

source_x86_64=("${_pkgname}-${pkgver}.tar::${_downloadurl}/linux/x86_x64/${_pkgname}-linux-${pkgver}.tar")
sha1sums_x86_64=('2aaa7e3af8037b0ec7cd16625a7d14ef97e71a92')
source_aarch64=("${_pkgname}-${pkgver}.tar::${_downloadurl}/linux/arm64/${_pkgname}-linux-${pkgver}.tar")
sha1sums_aarch64=('5c3c73ddc6a9a1b6e73ea2fc950c8d380f0a45ab')

package() {

    # Install zeronews binary
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install zeronews configuration file
    install -Dm a+r+w  /dev/null "${pkgdir}/etc/${_pkgname}/tcc.toml"

    #Install systemd service file
    install -Dm644  ${srcdir}/${_pkgname}/${_pkgname}.service -t ${pkgdir}/usr/lib/systemd/system
}
