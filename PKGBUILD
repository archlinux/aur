# Maintainer: Eduardo Parra <eduparra90@gmail.com>
pkgname=tarifas-luz-bin
pkgver=0.0.7
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
sha256sums_x86_64=(76c37ff896342de1f35e6406a564d5fb9448b0001b4b21a8b91f1c9682109832)

source=("tarifas-luz.svg::https://raw.githubusercontent.com/soker90/tarifas-luz/master/app/icon.svg")
sha256sums=(8e364439c3a6f8f746e225c6bb1bcb4656851c728920f0d213907770c472ab42)

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

