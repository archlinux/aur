# Maintainer: gastipatis <gastipatis@gmail.com>

pkgname="korobu"
pkgver="0.0.1_alpha"
makedepends=("rust>=1.65.0")
pkgrel="1"
pkgdesc="Data encryptor for plaintext and files"
url="https://github.com/osennij-morok/korobu"
arch=("x86_64")
license=("MIT")

source=("https://github.com/osennij-morok/korobu/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("1e8a7b98b56549edabf0a29c55adb22eaad7da9b1225e1705e002954908f104082ad80ec4070653eea0066e4b3fda0d6e060b1bc4ac225d088e517e90bbae2ed")

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cargo build --release
    cd -
    install -D "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
               "${pkgdir}/usr/bin/${pkgname}" 
    install -D "${srcdir}/${pkgname}-${pkgver}/icons/icon-64.png" \
               "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
    install -D "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" \
               "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE-MIT" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod +x "${pkgdir}/usr/bin/${pkgname}" 
}
