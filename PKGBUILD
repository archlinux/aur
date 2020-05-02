# Maintainer: Philipp A. <flying-sheep@web.de>

_name=psaw
pkgname=python-$_name
pkgver=0.0.12
pkgrel=1
pkgdesc='Pushshift.io API Wrapper for reddit.com public comment/submission search'
arch=('any')
url="https://github.com/dmarx/$_name"
license=('BSD')
depends=(python python-requests python-click)
makedepends=(install-wheel-scripts)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('cfbfdf1953ee5f31ca9d4ec6d471873ace960da9fbc7234b9d19a059d5cfa2d6')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
