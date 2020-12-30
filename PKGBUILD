# Maintainer: kyrenaios <kyrenaios at protonmail dot com>
pkgbase='python-mistune2'
pkgname=('python-mistune2')
_module='mistune'
pkgver='2.0.0a6'
pkgrel=1
pkgdesc="A sane Markdown parser with useful plugins and renderers (alpha v2 branch)"
url="https://github.com/lepture/mistune"
conflicts=('python-mistune')
provides=('python-mistune')
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5747cbb16fb50cd2ddd25d44d93b2c414a3b75875f6d9d58be8afbae67234ec9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
