# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=('python-gitsome')
_module='gitsome'
pkgver='0.6.0'
pkgrel=1
pkgdesc="A Supercharged Git/Shell Autocompleter with GitHub Integration."
url="https://github.com/donnemartin/gitsome"
depends=('python' 'python-ply' 'python-prompt_toolkit' 'python-requests' 'python-colorama' 'python-click' 'python-pygments' 'python-feedparser' 'python-pytz' 'python-docopt' 'python-uritemplate.py')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://pypi.python.org/packages/30/9a/2ac38108d08869abbcb757f52f28b6730f6cf249b2f13c161783655f1a0f/gitsome-${pkgver}.tar.gz")
md5sums=('66bf9620e442156cbb032851d33b75ed')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
