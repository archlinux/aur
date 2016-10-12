# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
pkgname=gnome-shell-extension-extensions-git
_pkgname=${pkgname%-git}

pkgver=r21.e64f753
pkgrel=1
pkgdesc="Extensions which allows to enable and disable extensions via a menu in the status area in the main menu panel."
arch=('any')
url="https://github.com/petres/gnome-shell-extension-extensions"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/petres/gnome-shell-extension-extensions")
_gitfolder="extensions@abteil.org"
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
	cp -r "$_gitfolder" "$pkgdir/usr/share/gnome-shell/extensions/"
}
