# Contributor: Carlos Franke <carlos_Franke at lemtank dot de>
_pkgname=azulejo
pkgname=$_pkgname-git
pkgver=r72.df4264a
pkgrel=1
pkgdesc="Window resizing and tiling utility"
arch=('any')
url=""
license=('custom')
groups=()
depends=('python3' 'gtk3' 'libkeybinder3' 'python-xlib' 'python-notify2' 'python-gobject')
makedepends=('git' 'python-setuptools')
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
	python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/azulejo/
  cp LICENSE $pkgdir/usr/share/licenses/azulejo/
}

# vim:set ts=2 sw=2 et:

