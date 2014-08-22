# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>

pkgname=unknown-horizons-git
pkgver=2013.3.832.ge886e11
pkgrel=1
pkgdesc="Open source real-time strategy game with the comfy Anno1602 feeling."
arch=("i686" "x86_64")
url="http://www.unknown-horizons.org"
license=('GPL' 'CCPL')
depends=('fife-git' 'python2' 'python2-yaml' 'python2-pillow')
makedepends=('git' 'intltool')
conflicts=('unknown-horizons-svn' 'unknown-horizons')
replaces=('unknown-horizons-svn' 'unknown-horizons')
source=("git://github.com/unknown-horizons/unknown-horizons.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	git describe  --tags --match "20[0-9][0-9]\.[0-9]" | sed 's/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-*}"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
