# Maintainer: Jingbei Li <i@jingbei.li>
pkgname=python-gcp-git
_gitname=gcp
pkgver=0.2.0.r4.g721632b
pkgrel=1
pkgdesc="gcp is a file copy tool, freely inspired from cp, but with a few high-level functionnality."
arch=("any")
url="https://code.lm7.fr/mcy/$_gitname"
license=('GPL3')
depends=('python' 'python-gobject2' 'python-dbus' 'dbus-glib')
source=("git+$url")
makedepends=('git' 'python-setuptools')
optdepends=('python-progressbar')
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git describe --long --tags 2>/dev/null| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root=/$pkgdir/ --optimize=1
}
