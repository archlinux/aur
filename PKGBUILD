# Maintainer: Remco Stoeten <remcostoeten@hotmail.com>
pkgname=skriuw-bin
pkgver=0.32.1
pkgrel=1
# v2 restarted versioning below v1's 0.25.0; the epoch keeps 1:0.5.0 sorting
# above the old un-epoched versions so pacman treats it as an upgrade.
epoch=1
_tag=v2-v0.32.1
pkgdesc="A quiet writing workspace for notes, journaling, sharing, and planning"
arch=('x86_64')
url="https://github.com/remcostoeten/skriuw"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=('skriuw')
conflicts=('skriuw')
options=('!strip' '!emptydirs')
source=("skriuw-${pkgver}.deb::https://github.com/remcostoeten/skriuw/releases/download/${_tag}/Skriuw_${pkgver}_amd64.deb")
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
