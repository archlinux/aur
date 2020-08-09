pkgname=python-django-silk
_name=${pkgname#python-}
pkgver=4.1.0
pkgrel=1
pkgdesc='Silky smooth profiling for Django'
arch=('any')
url=https://github.com/jazzband/django-silk
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-pip')
_wheel="${_name/-/_}-${pkgver}-py2.py3-none-any.whl"
sha256sums=('a331e55618fa62eaf3cf5a63f31bc1e91205efbeeca5e587c577498b0e251ed8')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
