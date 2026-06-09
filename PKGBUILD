pkgname=wolvenkit-cli-bin
pkgver=8.18.1
pkgrel=1
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL3')
depends=('dotnet-runtime')
source=("https://github.com/WolvenKit/WolvenKit/releases/download/${pkgver}/WolvenKit.ConsoleLinux-${pkgver}.zip")
sha256sums=('683c92c5ef8f5df4269b3f0a921bade02588baa4a3afcd833a883d75fa6cb6bf')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}" "${pkgdir}/opt/wolvenkit"
    rm "${pkgdir}/opt/wolvenkit/WolvenKit.ConsoleLinux-${pkgver}.zip"
    chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit"
}
