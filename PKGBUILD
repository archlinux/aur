pkgname=wolvenkit-cli-bin
pkgver=8.17.0
pkgrel=2
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL3')
depends=('dotnet-runtime')
source=("https://github.com/WolvenKit/WolvenKit/releases/download/${pkgver}/WolvenKit.ConsoleLinux-${pkgver}.zip")
sha256sums=('4305f78e6e7df523e3259efc2755fc810ca223851d95fd2c75b0878906e709cf')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}" "${pkgdir}/opt/wolvenkit"
    rm "${pkgdir}/opt/wolvenkit/WolvenKit.ConsoleLinux-${pkgver}.zip"
    chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit"
}
