# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=uki-efi-boot
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple utility that automatically scans for efi executables creates boot entries for them in the UEFI boot menu'
arch=(any)
url=https://codeberg.org/grafcube/${pkgname}
license=(GPL-3.0-only)
depends=(bash efibootmgr gettext util-linux jq systemd-ukify)
makedepends=()
provides=()
conflicts=()
backup=(etc/uki-efi-boot.conf)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('806deb2962cda7f6c00eb3e30f029f95997751576fd6b7b05be13292f4934226')

package() {
	cd "$pkgname"
	make INSTALL_ROOT=$pkgdir BINARY_PATH=/usr/bin install
}
