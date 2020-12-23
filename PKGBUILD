# Maintainer: Clement Benier <clement@benier.bzh>

_pkgbasename=new-mail-indicator
_extension_dir=/usr/share/gnome-shell/extensions/${_pkgbasename}@fthx
pkgname=gnome-shell-extension-${_pkgbasename}-git
pkgver=26
pkgrel=2
pkgdesc="New email notification icon for GNOME Shell."
arch=('any')
url="https://github.com/fthx/new-mail-indicator.git"
license=('GPL2')
depends=()
makedepends=('git' 'jq')
source=("${pkgname%-git}::git+https://github.com/fthx/new-mail-indicator.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	cat metadata.json | jq '{version}|.version'
}


package() {
		install -D -m644 "${srcdir}/${pkgname%-git}/extension.js" "${pkgdir}${_extension_dir}/extension.js"
		install -D -m644 "${srcdir}/${pkgname%-git}/metadata.json" "${pkgdir}${_extension_dir}/metadata.json"
}

