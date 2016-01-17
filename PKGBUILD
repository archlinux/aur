# Maintainer: Philippe Loctaux <phil@philippeloctaux.com>

pkgname=materialos-icon-theme-git
pkgver=0.r206.ad6d2ff
pkgrel=1
pkgdesc='A community driven material design icon pack'
arch=('any')
url='https://github.com/materialos/Linux-Icon-Pack'
license=('CCPL:by-sa')
makedepends=('git')
provides=('materialos-icon-theme')
conflicts=('materialos-icon-theme')
source=('git+https://github.com/materialos/Linux-Icon-Pack.git')
sha256sums=('SKIP')

pkgver() {
	cd Linux-Icon-Pack/

	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd Linux-Icon-Pack/

	install -dm 755 "$pkgdir"/usr/share/icons
	cp -dr --no-preserve='ownership' Icons/* "$pkgdir"/usr/share/icons/
}
