# Maintainer: Clement Benier <clement@benier.bzh>

_pkgbasename=new-mail-indicator
pkgname=gnome-shell-extension-${_pkgbasename}-git
pkgver=17aa221
pkgrel=1
pkgdesc="New email notification icon for GNOME Shell."
arch=('any')
url="https://github.com/fthx/new-mail-indicator.git"
license=('GPL2')
depends=()
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/fthx/new-mail-indicator.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	git describe --always | sed "s/-/+/g"
}


package() {
		install -D -m644 "${srcdir}/${pkgname%-git}/extension.js" "$pkgdir/usr/share/gnome-shell/extensions/${_pkgbasename}@gnome-shell-extensions.fthx.github.com/extension.js"
		install -D -m644 "${srcdir}/${pkgname%-git}/metadata.json" "$pkgdir/usr/share/gnome-shell/extensions/${_pkgbasename}@gnome-shell-extensions.fthx.github.com/metadata.json"
}

