# Maintainer: Jahongir Ahmadaliev jahamarsi@gmail.com
pkgname=r7draw-desktop-bin
pkgver=26.1.2
pkgrel=1
pkgdesc="R7-graphics - creating flowcharts and diagrams"
arch=('x86_64')
url="https://gitlab.r7-office.ru/draw/r7draw-desktop"
license=('Apache-2.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: значок в системном трее')
provides=('r7draw-desktop')
conflicts=('r7draw-desktop')
options=('!strip')
source=("https://download.r7-office.ru/r7graph/r7draw-desktop-amd64-${pkgver}.deb")
sha256sums=('dfa1b1a838e98261f4cb9495560a7c399e671e114de0a8161f6e10b973990514')

package() {
    tar xf data.tar.xz -C "${pkgdir}"

    chmod 4755 "${pkgdir}/opt/Р7-Графика/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/Р7-Графика/r7draw-desktop" "${pkgdir}/usr/bin/r7draw-desktop"
}
