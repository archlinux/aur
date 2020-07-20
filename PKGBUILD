# Maintainer: Philipp A. <flying-sheep@web.de>

_name=sqlalchemy-mixins
pkgname=python-$_name
pkgver=1.2.1
pkgrel=1
pkgdesc='Active Record, Django-like queries, nested eager load and beauty __repr__ for SQLAlchemy'
arch=(any)
url="https://github.com/absent1706/$_name"
license=(MIT)
depends=('python-sqlalchemy>=1.0' 'python-six')
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('97bc52ef5e5b5f226130c8d3d667d600c083cc1627e2a1417462c7b10f8f3cd5')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
