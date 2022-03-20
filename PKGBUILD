# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-cursors-theme-git
_pkgname=sweet
pkgver=r248.802e805
pkgrel=1
pkgdesc="Cursors for Sweet theme"
arch=('x86_64')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
groups=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=("sweet-cursors-theme")
conflicts=('sweet-cursor-theme-git' 'sweet-cursor-theme')
source=("git+$url.git#branch=nova")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	# cd ${_pkgname}
    # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname/kde
	install -d $pkgdir/usr/share/icons
	mv cursors/Sweet-cursors $pkgdir/usr/share/icons
}
 
