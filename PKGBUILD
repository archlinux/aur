# Maintainer: Alexey Andreyev <aa13q.ru>

pkgname=('python-gitim-git')
_module='gitim'
pkgver='1.47'
pkgrel=1
pkgdesc="Clone all of your Github repositories, just single command from your terminal"
url="https://github.com/muhasturk/gitim"
depends=('python' 'python-pygithub')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${_module}-${pkgver}::git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
