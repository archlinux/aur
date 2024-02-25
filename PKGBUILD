# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_name=varname
pkgname=python-varname
pkgver=0.13.0
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes"
arch=('any')
url="https://github.com/pwwang/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-virtualenv' 'python-cachecontrol' 'python-poetry-plugin-export' 'python-jsonschema')
source=(https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl
        https://raw.githubusercontent.com/pwwang/python-varname/master/LICENSE)
sha512sums=('3c6a1e985d0da62ab79bf594463dd2ee4572ad4fc537e440f64ae9faff6be4815fe7a940865941e5cde14ac8fa32bedd98176eb6307c2ea7b220b5d119c0c9c5'
            '2828675fdc0587a146cdefb17d5c6fb9f3bd657a57c920bf0bc49a6c4dcc1e7a462b2c918d3b724510e85966eb02f66b2a96bcb4f368613fec18992c429f2c84')

#build() {
#  cd "${pkgname}-${pkgver}"
#  python -m build --wheel --no-isolation
#}

package() {
#  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
