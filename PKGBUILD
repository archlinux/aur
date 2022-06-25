# Maintainer: tyusha <htovver@gmail.com>
pkgname='kodi-openbox-git'
pkgver=r49.f52d176
pkgrel=1
pkgdesc="An xsession that runs Kodi media center on top of an Openbox session"
arch=('any')
url="https://github.com/lufinkey/kodi-openbox"
license=('unknown')
depends=('bash' 'openbox' 'kodi')
makedepends=('git')
source=("${pkgname}::git+https://github.com/lufinkey/kodi-openbox.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 "./kodi-openbox/usr/bin/kodi-openbox-runprogram" "$pkgdir/usr/bin/kodi-openbox-runprogram"
	install -Dm755 "./kodi-openbox/usr/bin/kodi-openbox-runprogram.real" "$pkgdir/usr/bin/kodi-openbox-runprogram.real"
	install -Dm755 "./kodi-openbox/usr/bin/kodi-openbox-session" "$pkgdir/usr/bin/kodi-openbox-session"
	
	install -Dm644 "./kodi-openbox/usr/share/xsessions/kodi-openbox.desktop" "$pkgdir/usr/share/xsessions/kodi-openbox.desktop"
}
