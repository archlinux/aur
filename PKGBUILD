# Maintainer: Philipp A. <flying-sheep@web.de>

_name=sqlalchemy-mixins
pkgname=python-$_name
pkgver=1.5
pkgrel=1
pkgdesc='Active Record, Django-like queries, nested eager load and beauty __repr__ for SQLAlchemy'
arch=(any)
url="https://github.com/absent1706/$_name"
license=(MIT)
depends=('python-sqlalchemy>=1.0' python-six)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('c512f8393679d7e5effba742fb1b2d5e242d8c44d4d9e20abd0f3ba5136bc32d')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
