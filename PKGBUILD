# Maintainer: Philipp A. <flying-sheep@web.de>

_name=sadisplay
pkgname=python-$_name
pkgver=0.4.9
pkgrel=1
pkgdesc='SqlAlchemy schema display script'
arch=(any)
url="https://bitbucket.org/estin/sadisplay/wiki/Home"
license=(BSD)
depends=(python-pandas python-sqlalchemy)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/3.6/${_name::1}/$_name/$_wheel")
sha256sums=('bf456f582b8f5da19fedef7a9afe969b49231d79724710bc7d35c9439f44c2fc')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
