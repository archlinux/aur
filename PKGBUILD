pkgbase='python-pytrends'
pkgname=('python-pytrends')
_module='pytrends'
pkgver='4.7.1'
pkgrel=1
pkgdesc="Pseudo API for Google Trends"
url="https://github.com/dreyco676/pytrends"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/13/4b/6db651dfd8c6c8132879a6980aa323123c6aade5b371c9083de6a21c0b07/pytrends-${pkgver}-py2.py3-none-any.whl")
sha256sums=('1897a48059639c706ef07a7ce6362a4fa092f49a1e28f578f180a77de2972532')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
