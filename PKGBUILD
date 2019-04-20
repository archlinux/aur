# Maintainer: Seth Murphy <seth.murphy18@gmail.com>
# PGP ID: 1DB95DC235C2C613

pkgname="expandrive-bin"
pkgver="7.0.5"
pkgrel="1"
pkgdesc="A utility for managing multiple cloud storage services"
arch=("x86_64")
url="https://www.expandrive.com/"
license=("custom:proprietary")
depends=(
    "gconf>=2"
    "libnotify"
    "libappindicator-gtk3"
    "libxtst"
    "nss"
    "libxss"
)

source=("https://packages.expandrive.com/pool/stable/e/ex/ExpanDrive_${pkgver}_amd64.deb")
sha256sums=("7676526f6655605a3c0774a639b154d865678e8e7b07d889e16bc080e7bd632b")

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
}

post_install() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ln -sf '/opt/ExpanDrive/expandrive' '/usr/local/bin/expandrive'
}

post_remove() {
    rm -f '/usr/local/bin/expandrive'
}