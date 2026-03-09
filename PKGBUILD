pkgname=wolvenkit-cli-bin
pkgver=8.17.3
pkgrel=1
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL3')
depends=('dotnet-runtime')
source=("https://github.com/WolvenKit/WolvenKit/releases/download/${pkgver}/WolvenKit.ConsoleLinux-${pkgver}.zip")
sha256sums=('e029b7ddb106e8ac0ffb5e4845ea921ecef6ea96caac5e1e174a4bceadeb22b5')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}" "${pkgdir}/opt/wolvenkit"
    rm "${pkgdir}/opt/wolvenkit/WolvenKit.ConsoleLinux-${pkgver}.zip"
    chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit"
}
