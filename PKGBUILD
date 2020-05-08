# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=('gitsome')
_module='gitsome'
pkgver='0.8.0'
pkgrel=1
pkgdesc="Supercharged Git/Shell Autocompleter with GitHub Integration"
url="https://github.com/donnemartin/gitsome"
depends=('python37' 'python-ply' 'python-prompt_toolkit' 'python-requests' 'python-colorama' 'python-click' 'python-pygments' 'python-feedparser' 'python-pytz' 'python-docopt' 'python-uritemplate' 'python-numpydoc')
makedepends=('python-setuptools')
conflicts=('xonsh' 'python-gitsome')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('019502a618974d9be3e3ab98dd0178ef418236e7f7f9b94386a9dcabd540d8ca')

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
