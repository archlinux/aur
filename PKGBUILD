# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname="plymouth-theme-artix-logo-new"
pkgver=0.2
pkgrel=3
pkgdesc="Replace the logo from package plymouth-theme-artix-logo"
arch=('any')
url="https://gitlab.com/menelkir/plymouth-artix-logo-new"
license=('GPL')
depends=('plymouth')
source=(https://gitlab.com/menelkir/plymouth-artix-logo-new/-/archive/v${pkgver}/plymouth-artix-logo-new-v${pkgver}.tar.bz2)
sha256sums=('926409c40b1413a15b5367b8a00c27dcdd709b0aa5d924ff9a79569b474263b4')

package() {
    cd "${srcdir}/plymouth-artix-logo-new-v${pkgver}"
    mkdir -p $pkgdir/usr/share/plymouth/themes/artix-logo-new
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/artix-logo-new
}

post_install() {
    echo "==> To activate run:"
    echo "==> sudo plymouth-set-default-theme -R artix-logo-new"
}

post_upgrade() {
    post_install $1
}


