# Maintainer: soker90 <soker90@users.noreply.github.com>
pkgname=tarifas-luz-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Comparador de tarifas de luz en España"
arch=('x86_64')
url="https://github.com/soker90/tarifas-luz"
license=('MIT')
depends=('webkit2gtk-4.1')
provides=('tarifas-luz')
conflicts=('tarifas-luz')
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}::https://github.com/soker90/tarifas-luz/releases/download/v${pkgver}/tarifas-luz_${pkgver}_linux_amd64")
sha256sums_x86_64=(0dc57290535e1ee36d66a8111681110aff4888dab08f32870c41f182fa3d3caa)

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/tarifas-luz"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/tarifas-luz.desktop" << EOF
[Desktop Entry]
Name=Tarifas Luz
Comment=Comparador de tarifas de luz en España
Exec=tarifas-luz
Icon=tarifas-luz
Type=Application
Categories=Utility;Finance;
EOF
}

