# Maintainer: kyrenaios <kyrenaios at protonmail dot com>
pkgbase='python-md2gemini'
pkgname=('python-md2gemini')
_module='md2gemini'
pkgver='1.8.1'
pkgrel=1
pkgdesc="Convert Markdown to the Gemini text format"
url="https://github.com/makeworld-the-better-one/md2gemini"
depends=('python' 'python-mistune2' 'python-cjkwrap' 'python-wcwidth')
makedepends=('python-setuptools')
license=('LGPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('3ef2bd2d9e2b4968a844a2858f721348429f3a0b5976bd1c324198538103ca55')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
