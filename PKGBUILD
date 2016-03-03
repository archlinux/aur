# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=lightdm-webkit-theme-material-git
pkgver=20160302
pkgrel=1
pkgdesc="A material design LightDM theme"

arch=('any')
url="https://github.com/artur9010/lightdm-webkit-material"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
makedepends=('git')
source=('git+https://github.com/artur9010/lightdm-webkit-material.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/lightdm-webkit-material/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material"
	cp -r "$srcdir/lightdm-webkit-material/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material/"
}
