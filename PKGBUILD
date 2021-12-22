pkgname=python-django-silk
_name=${pkgname#python-}
pkgver=4.2.0
pkgrel=1
pkgdesc='Silky smooth profiling for Django'
arch=('any')
url=https://github.com/jazzband/django-silk
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-pip')
_wheel="${_name/-/_}-${pkgver}-py3-none-any.whl"
sha256sums=('5e70b5351f04e3c4ea4fe6bc16c95bfee776006422dd5e7827e6e3db23dc41ec')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
