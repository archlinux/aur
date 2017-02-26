# Contributor: Carlos Franke <carlos_Franke at lemtank dot de>
_pkgname=azulejo
pkgname=$_pkgname-git
pkgver=r68.4c6c8e8
pkgrel=1
pkgdesc="Window resizing and tiling utility"
arch=('any')
url=""
license=('custom')
groups=()
depends=('python2' 'gtk3' 'libkeybinder3' 'python2-xlib' 'python2-notify2' 'python2-gobject')
makedepends=('git' 'python2-setuptools')
provides=('azulejo')
conflicts=('azulejo')
options=(!emptydirs)
install=
source=('git+https://github.com/gillesB/azulejo.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/azulejo/
  cp LICENSE $pkgdir/usr/share/licenses/azulejo/
}

# vim:set ts=2 sw=2 et:

