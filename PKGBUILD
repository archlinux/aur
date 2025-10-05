pkgname=wolvenkit-cli-bin
pkgver=8.17.1
pkgrel=1
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL3')
depends=('dotnet-runtime')
source=("https://github.com/WolvenKit/WolvenKit/releases/download/${pkgver}/WolvenKit.ConsoleLinux-${pkgver}.zip")
sha256sums=('b411bc0c17524785cb712d3c16dbc09b0484c8c26abfce280091439e50aaeeba')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}" "${pkgdir}/opt/wolvenkit"
    rm "${pkgdir}/opt/wolvenkit/WolvenKit.ConsoleLinux-${pkgver}.zip"
    chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit"
}
