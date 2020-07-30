# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-prompt_toolkit1014
pkgver=1.0.14
pkgrel=1
pkgdesc='A library for building powerful interactive command lines and terminal applications in Python'
arch=('any')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
provides=('python-prompt_toolkit=1.0.14')
conflicts=('python-prompt_toolkit' 'python-prompt_toolkit1')
depends=('python-six'
         'python-wcwidth')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/55/56/8c39509b614bda53e638b7500f12577d663ac1b868aef53426fc6a26c3f5/prompt_toolkit-${pkgver}.tar.gz")
sha256sums=('cc66413b1b4b17021675d9f2d15d57e640b06ddfd99bb724c73484126d22622f')

package() {
  cd "prompt_toolkit-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}