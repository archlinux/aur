# Maintainer: Remco Stoeten <remcostoeten@hotmail.com>
pkgname=skriuw-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="A quiet writing workspace for notes, journaling, sharing, and planning"
arch=('x86_64')
url="https://github.com/remcostoeten/skriuw"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=('skriuw')
conflicts=('skriuw')
options=('!strip' '!emptydirs')
source=("skriuw-${pkgver}.deb::https://github.com/remcostoeten/skriuw/releases/download/desktop-v${pkgver}/Skriuw_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    bsdtar -xf "skriuw-${pkgver}.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"

    if [ -f "${pkgdir}/usr/share/doc/skriuw/LICENSE" ]; then
        install -Dm644 "${pkgdir}/usr/share/doc/skriuw/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
