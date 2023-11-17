# Maintainer: Archeb <archebasic@hotmail.com>
pkgname=opentrace-bin
pkgver=1.4.0.0
pkgrel=1
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
depends=('nexttrace>=1.1.7' 'webkit2gtk') 
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Archeb/opentrace/releases/download/v${pkgver}/linux-x64.tar.gz"
        "opentrace.desktop::https://raw.githubusercontent.com/Archeb/opentrace/master/opentrace.desktop"
        "logo.png::https://raw.githubusercontent.com/nxtrace/Ntrace-core/main/asset/logo.png")
sha256sums=('dfb6b8d044fa378a5a086ac42f216433b0a8b4d6e73e4b18476fd0c49a7994dd'
            '69f8c4799f6db03bf17cd78b1de7a18d939ec5e282190942172dbe13e39c2075'
            '93cf17802f2691d63e29a7020afb0c7c39782c85212ce4b795cc8486f36c758d')

package() {
  install -Dm755 -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname}"
  mkdir -p ${pkgdir}/usr/bin
  ln -sf "/opt/${pkgname}/OpenTrace" ${pkgdir}/usr/bin/opentrace
  install -Dm644 "../opentrace.desktop" "${pkgdir}/usr/share/applications/opentrace.desktop"
  install -Dm644 "../logo.png" "$pkgdir/usr/share/pixmaps/opentrace.png"
}
