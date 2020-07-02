pkgname=python-django-silk
_name=${pkgname#python-}
pkgver=4.0.1
pkgrel=1
pkgdesc='Silky smooth profiling for Django'
arch=('any')
url=https://github.com/jazzband/django-silk
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-pip')
_wheel="${_name/-/_}-${pkgver}-py2.py3-none-any.whl"
sha256sums=('56c2c5aefd1c65161df61e49cf2674862a748a43e81c7c470bcbc4c35c53491c')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}