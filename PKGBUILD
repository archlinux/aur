# Maintainer: Lev Lybin <aur@devtrue.net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=synology-assistant
pkgver=5566
_sver=5.2
pkgrel=3
pkgdesc="It helps you set up and install DSM on your DiskStation"
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
install=synology-assistant.install

source_x86_64=(http://global.download.synology.com/download/Tools/Assistant/${_sver}-${pkgver}/Ubuntu/x86_64/SynologyAssistant-${_sver}-${pkgver}_amd64.deb)
md5sums_i686=('db0a70fe2bf14840229d88b71b6c4994')
md5sums_x86_64=('05849dc21a46e39e879f24c549004533')
source_i686=(http://global.download.synology.com/download/Tools/Assistant/${_sver}-${pkgver}/Ubuntu/i686/SynologyAssistant-${_sver}-${pkgver}_i386.deb)

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
