# Maintainer: gastipatis <gastipatis@gmail.com>

pkgname="korobu"
pkgver="alpha_0.0.1"
makedepends=("rust>=1.65.0")
pkgrel="1"
pkgdesc="Data encryptor for plaintext and files"
url="https://github.com/osennij-morok/korobu"
arch=("x86_64")
license=("MIT")

source=("https://github.com/osennij-morok/korobu/archive/refs/heads/master.zip")
sha512sums=("7c1d7b096bcc998a8d21526a35216d52e91260af4432cee77f51320772c048002fa29f91c1a85113acab6344ce564d6862d044d6cb6e58fa1bad60cd17fc8133")

package() {
    cd ${srcdir}/${pkgname}-master
    cargo build --release
    cd -
    install -D "${srcdir}/${pkgname}-master/target/release/${pkgname}" \
               "${pkgdir}/usr/bin/${pkgname}" 
    install -D "${srcdir}/${pkgname}-master/icons/icon-64.png" \
               "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
    install -D "${srcdir}/${pkgname}-master/${pkgname}.desktop" \
               "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-master/LICENSE-MIT" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod +x "${pkgdir}/usr/bin/${pkgname}" 
}
