# Maintainer: Jia Yin<lok-ation at outlook dot com>

pkgname=sddm-minesddm-theme-git
pkgver=v1.1.0.r10.g428ca3f
pkgrel=2
pkgdesc='A Minecraft themed SDDM.'
arch=('any')
url="https://github.com/Davi-S/sddm-theme-minesddm"
license=('AGPL-3.0-only')
depends=('sddm' 'qt5-quickcontrols2' 'layer-shell-qt5')
makedepends=('git')
source=("$pkgname::git+$url")
sha512sums=('SKIP')
pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/share/sddm/themes"
	cp -R minesddm "$pkgdir/usr/share/sddm/themes/"
	chmod -R 755 "$pkgdir/usr/share/sddm/themes/minesddm"
}
