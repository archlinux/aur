# Maintainer: Semyon Bochkaryov <squizduos@gmail.com>
# Contributor: Semyon Bochkaryov <squizduos@gmail.com>

pkgname=telefuel-desktop
pkgver=0.1.1
pkgrel=1
pkgdesc="Telefuel desktop app"
arch=("x86_64")
url="https://telefuel.com/"
license=('custom:chromium')
groups=('')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libutil-linux' 'libxss' 'libxtst' 'nss' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install


source=(
    "https://desktop-downloads.s3.amazonaws.com/Telefuel+Linux.zip"
)
sha256sums=(
    "0bea54dd40a9659b3c88286005e042d225ede0523a5e2bfc176ae41f1e7d2c43"
)

build() {
    ar x "${srcdir}/Telefuel.deb"
}


package() {
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Telefuel/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
