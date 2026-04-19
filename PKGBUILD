# Maintainer: Pete Jackson <pete@peteonrails.com>
pkgname=cathode-phosphor-icon-theme-git
pkgver=r3.4a99411
pkgrel=1
pkgdesc="Green phosphor CRT-style icon theme for GNOME, inspired by retro terminal aesthetics"
arch=('any')
url="https://github.com/peteonrails/cathode-phosphor-icon-theme"
license=('CC-BY-SA-4.0')
depends=('hicolor-icon-theme')
optdepends=('yaru-icon-theme: fallback icons for uncovered names')
makedepends=('git')
provides=('cathode-phosphor-icon-theme')
conflicts=('cathode-phosphor-icon-theme')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -d "${pkgdir}/usr/share/icons/cathode-phosphor"
    cp -r cathode-phosphor/* "${pkgdir}/usr/share/icons/cathode-phosphor/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
