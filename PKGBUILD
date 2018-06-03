# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=('gitsome')
_module='gitsome'
pkgver='0.7.2'
pkgrel=1
pkgdesc="Supercharged Git/Shell Autocompleter with GitHub Integration"
url="https://github.com/donnemartin/gitsome"
depends=('python35' 'python-ply' 'python-prompt_toolkit' 'python-requests' 'python-colorama' 'python-click' 'python-pygments' 'python-feedparser' 'python-pytz' 'python-docopt' 'python-uritemplate.py' 'python-numpydoc')
makedepends=('python-setuptools')
conflicts=('xonsh' 'python-gitsome')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('7306daff07784650921e548d5886d5dd')

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
