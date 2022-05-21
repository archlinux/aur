# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=thunar-nextcloud-plugin
pkgver=1.0
pkgrel=2
epoch=
pkgdesc=" A plugin for sharing files via the Nextcloud client from within the Thunar file manager"
arch=("x86_64")
url="https://github.com/frederikmoellers/thunar-nextcloud-plugin"
license=('GPL-3')
groups=()
depends=("thunar" "nextcloud-client" "gtk3")
makedepends=("gcc" "unzip" "bash")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/frederikmoellers/thunar-nextcloud-plugin/archive/3015ee5bce2db072a2eeaa158150af2d7c0bfba6.zip")
noextract=()
sha256sums=("d43e249fb9771a857dcca706a912cc631da7bbe259e5cdaac2a7eaa725ffda82")
validpgpkeys=()

build() {
	unzip -f 3015ee5bce2db072a2eeaa158150af2d7c0bfba6.zip
	cd thunar-nextcloud-plugin-3015ee5bce2db072a2eeaa158150af2d7c0bfba6
	bash compile.sh
}

package() {
	cd thunar-nextcloud-plugin-3015ee5bce2db072a2eeaa158150af2d7c0bfba6
	install -D thunar-nextcloud-plugin.so "$pkgdir"/usr/lib/thunarx-3/thunar-nextcloud-plugin.so
}
