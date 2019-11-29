# Maintainer: Semyon Bochkaryov <squizduos@gmail.com>
# Contributor: Semyon Bochkaryov <squizduos@gmail.com>

pkgname=telefuel-desktop
pkgver=0.1.2
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
    "cc985030d7ad67c1ee26618b05aeca1ab258fc9d5e53e5d00dc361e43a6ed8dc"
)

build() {
    ar x "${srcdir}/Telefuel.deb"
}


package() {
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Telefuel/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
