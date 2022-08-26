# Maintainer: Mario Mansilla <mariomanfer@gmail.com>
pkgname=rtl8814au-morrownr-git
pkgver=1.0.r.
pkgrel=1
epoch=
pkgdesc="Linux Driver for USB WiFi Adapters that are based on the RTL8814AU Chipset made by morrownr."
arch=(x86_64)
url="https://github.com/morrownr/8814au.git"
license=('GPL')
groups=()
depends=()
makedepends=(linux-headers dkms git)
checkdepends=()
optdepends=()
provides=(RTL8814AU)
conflicts=()
replaces=()
backup=()
options=()
install=.INSTALL
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
        cd "${_pkgname}"
        printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd 8814au
        sudo ./install-driver.sh
		pwd
		pwd > /tmp/pwd
		install -Dm755 remove-driver.sh "$pkgdir/usr/bin/remove-8814au-driver.sh"
        install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
}
