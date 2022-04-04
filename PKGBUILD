# Maintainer: Niklas Leinz <niklas[at]corusm[dot]de>

# TODO: Update 1.0.0 to $pkgver
# https://wiki.archlinux.org/title/AUR_submission_guidelines

pkgname="mouselogger-git"
pkgver="1.0.3"
pkgrel="1"
pkgdesc="MouseLogger for University DataScience Project"
arch=("x86_64")
url="https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App"
license=("custom")
source=("git+http://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App.git")
sha512sums=("SKIP")


package() {
    # Package
    mkdir -p "${pkgdir}/usr/bin"
    wget https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App/releases/latest/download/mouselogger-linux
    cp "${srcdir}/mouselogger-linux" "${pkgdir}/usr/bin/mouselogger"
    chmod +x "${pkgdir}/usr/bin/mouselogger"

    # Install Desktop File
    install -Dm644 "${srcdir}/MouseLogger-App/mouselogger.desktop" "$pkgdir/usr/share/applications/mouselogger.desktop"

    # Install Icon File
    install -Dm644 "${srcdir}/MouseLogger-App/mouselogger.png" "$pkgdir/usr/share/applications/mouselogger.png"
}
