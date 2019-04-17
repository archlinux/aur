# Maintainer: Seth Murphy <seth.murphy18@gmail.com>
# PGP ID: 1DB95DC235C2C613

pkgname="expandrive-bin"
pkgver="7.0.3"
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
sha256sums=("2eee12d30766d2f2a5521fa78aed167069ad39a8ab306e7aeedd61b23e4930bc")

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