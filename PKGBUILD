# Maintainer:  Birk Birkner <aur at bbirkner.de>

pkgname=waydroid-magisk
pkgver=1.2.10
pkgrel=1
_commit='fe312bcee08ff124ace27df352179701061a4811'
pkgdesc="Magisk Delta manager for Waydroid"
arch=('any')
url="https://github.com/nitanmarcel/waydroid-magisk"
license=('GPL3')
depends=(
    'waydroid'
    'python'
    'dbus-python'
    'python-configparser'
)
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/nitanmarcel/waydroid-magisk.git#commit=$_commit")
sha256sums=('SKIP')

package () {
    cd "$srcdir/$pkgname"
    make install USE_SYSTEMD=1 DESTDIR="${pkgdir}"
}
