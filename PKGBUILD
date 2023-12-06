# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_name=varname
pkgname=python-varname
pkgver=0.12.2
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes"
arch=('any')
url="https://github.com/pwwang/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-virtualenv' 'python-cachecontrol' 'python-poetry-plugin-export' 'python-jsonschema')
source=(https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl
        https://raw.githubusercontent.com/pwwang/python-varname/master/LICENSE)
sha512sums=('885e6d97fe8e4492d6d34c8e4305264f9d3c8f99fdd11e58434e699b4b6e3058a77d7ba68623a6d34c799dc4a1bd92ae4756c27643a4285464c787ab98b77874'
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
