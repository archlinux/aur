# Maintainer: Lev Lybin <aur@devtrue.net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=synology-assistant
pkgver=6.1.15163
_pkgver=6.1-15163
pkgrel=1
pkgdesc="It helps you set up and install DSM on your DiskStation"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/releaseNote/Assistant"
license=('unknown')
install=synology-assistant.install
depends=('libpng12' 'libxrender' 'libxt' 'libxext' 'fontconfig')
source_x86_64=(https://global.download.synology.com/download/Tools/Assistant/${_pkgver}/Ubuntu/x86_64/synology-assistant_${_pkgver}_amd64.deb)
source_i686=(https://global.download.synology.com/download/Tools/Assistant/${_pkgver}/Ubuntu/i686/synology-assistant_${_pkgver}_i386.deb)
md5sums_i686=('6aa8973f58a77eb01141482bce82ea26')
md5sums_x86_64=('ea2c6cb361422eee1aeb31702bd88c22')

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
