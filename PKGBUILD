pkgname=wolvenkit-cli-bin
pkgver=8.11.1
pkgrel=1
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL3')
depends=('dotnet-runtime')
source=('https://github.com/WolvenKit/WolvenKit/releases/download/8.11.1/WolvenKit.ConsoleLinux-1.11.0.zip')
sha256sums=('9b6b9a218bcd059d8dab4894015f88985856fb607345afc30142b6f768598580')

package() {
    mkdir -p "${pkgdir}/opt"
    rm "${srcdir}/WolvenKit.ConsoleLinux-1.11.0.zip"
    cp -r "${srcdir}" "${pkgdir}/opt/wolvenkit"
    chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit"
}

