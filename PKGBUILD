# Maintainer: Niklas <dev@n1klas.net>

pkgname=python-aiohttp-jinja
_name=aiohttp-jinja2
pkgver=1.0.0
pkgrel=1
pkgdesc="Jinja2 template renderer for aiohttp.web"
arch=('any')
url="https://github.com/aio-libs/aiohttp-jinja2"
license=('Apache')
depends=('python-aiohttp>=3.0.0' 'python-jinja>=2.7')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('e323b3cd72af6fde7408f4073ab171e0de1183c417fc9297e85bf56254bf63bb17282c782dfba0c20056b5ba857812fc61364bfb6f87b30d4ee821dbb229ff6b')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
