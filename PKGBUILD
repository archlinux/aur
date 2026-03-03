pkgname=wolvenkit-cli-bin
pkgver=8.17.2
pkgrel=1
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL3')
depends=('dotnet-runtime')
source=("https://github.com/WolvenKit/WolvenKit/releases/download/${pkgver}/WolvenKit.ConsoleLinux-${pkgver}.zip")
sha256sums=('115b9481d34ba4d8b0bbf7f19fb757e53909b74585e7e955b2b62f94ed05a974')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}" "${pkgdir}/opt/wolvenkit"
    rm "${pkgdir}/opt/wolvenkit/WolvenKit.ConsoleLinux-${pkgver}.zip"
    chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit"
}
