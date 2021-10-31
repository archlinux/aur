# Maintainer: Niklas Leinz <niklas[at]corusm[dot]de>
pkgname="mouselogger-git"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="MouseLogger for University DataScience Project"
arch=("x86_64")
url="https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App"
license=("custom")
source=("https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App/archive/refs/tags/v1.0.0.tar.gz")
sha512sums=("SKIP")


package() {
    # Package
    mkdir -p "${pkgdir}/usr/bin"
    wget https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App/releases/download/v1.0.0/mouselogger
    cp "${srcdir}/mouselogger" "${pkgdir}/usr/bin/mouselogger"
    chmod +x "${pkgdir}/usr/bin/mouselogger"

    # Install Desktop File
    install -Dm644 "${srcdir}/MouseLogger-App-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install Icon File
    install -Dm644 "${srcdir}/MouseLogger-App-$pkgver/mouselogger.png" "$pkgdir/usr/share/applications/$pkgname.png"
}
