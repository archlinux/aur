# Maintainer: Gianlucca Claudino <gianluccaclaudino@gmail.com>

pkgname=lvsk-calendar
pkgver=0.2.8
pkgrel=1
pkgdesc="A beautiful text-based calendar with visual aesthetics for Arch Linux"
arch=('any')
url="https://github.com/Gianluska/lvsk-calendar"
license=('MIT')
depends=('bash' 'coreutils')
makedepends=()
install="${pkgname}.install"

# The source files are in the same directory as the PKGBUILD
source=("git+https://github.com/Gianluska/lvsk-calendar.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    # Source files are already present
    :
}

build() {
    # Nothing to compile
    :
}

package() {
    # Install the main executable
    install -Dm755 "${srcdir}/${pkgname}/lvsk-calendar" "${pkgdir}/usr/bin/lvsk-calendar"

    # Install the modular source files
    install -Dm644 "${srcdir}/${pkgname}/src/config.sh" "${pkgdir}/usr/share/${pkgname}/src/config.sh"
    install -Dm644 "${srcdir}/${pkgname}/src/utils.sh" "${pkgdir}/usr/share/${pkgname}/src/utils.sh"
    install -Dm644 "${srcdir}/${pkgname}/src/navigation.sh" "${pkgdir}/usr/share/${pkgname}/src/navigation.sh"
    install -Dm644 "${srcdir}/${pkgname}/src/input.sh" "${pkgdir}/usr/share/${pkgname}/src/input.sh"

    # Install UI components
    install -Dm644 "${srcdir}/${pkgname}/src/ui/background.sh" "${pkgdir}/usr/share/${pkgname}/src/ui/background.sh"
    install -Dm644 "${srcdir}/${pkgname}/src/ui/header.sh" "${pkgdir}/usr/share/${pkgname}/src/ui/header.sh"
    install -Dm644 "${srcdir}/${pkgname}/src/ui/calendar.sh" "${pkgdir}/usr/share/${pkgname}/src/ui/calendar.sh"
    install -Dm644 "${srcdir}/${pkgname}/src/ui/footer.sh" "${pkgdir}/usr/share/${pkgname}/src/ui/footer.sh"
}

# vim:set ts=4 sw=4 et:
