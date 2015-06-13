# Contributor: wido <widowild [at] myopera [dot] com>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys-keymaps-git
_gitname="logkeys-keymaps"
pkgver=2012.12.11
pkgrel=1
pkgdesc="Keymaps pack for logkeys."
arch=('any')
license=('GPL3')
url="http://code.google.com/p/logkeys/"
conflicts=('logkeys-keymap' 'logkeys-keymaps')
provides=('logkeys-keymaps')
source=("$_gitname::git+http://wiki.logkeys.googlecode.com/git/")
md5sums=("SKIP")

pkgver() {
        cd "$_gitname"
        git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

package() {
	cd "${srcdir}/$_gitname/keymaps"
	for filename in $(ls *.map); do
		install -D -m 644 "${filename}" "${pkgdir}/usr/share/lkmaps/${filename}"
	done
}
