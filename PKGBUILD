# Maintainer: Lev Lybin <aur@devtrue.net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=synology-assistant
pkgver=15030
_sver=6.1
pkgrel=1
pkgdesc="It helps you set up and install DSM on your DiskStation"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/releaseNote/Assistant"
license=('unknown')
install=synology-assistant.install

source_x86_64=(https://global.download.synology.com/download/Tools/Assistant/${_sver}-${pkgver}/Ubuntu/x86_64/synology-assistant_${_sver}-${pkgver}_amd64.deb)
md5sums_i686=('76c6a0cd107d2d3491cc125b530589cd')
md5sums_x86_64=('83ea141bcdc93c3ae1387677c37d2eea')
source_i686=(https://global.download.synology.com/download/Tools/Assistant/${_sver}-${pkgver}/Ubuntu/i686/synology-assistant_${_sver}-${pkgver}_i386.deb)

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/SynologyAssistant/SynologyAssistant "${pkgdir}/usr/bin/synology-assistant"

    install -Dm644 usr/share/applications/synology-assistant.desktop "${pkgdir}/usr/share/applications/synology-assistant.desktop"
}
