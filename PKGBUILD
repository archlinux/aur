# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=python-html2md
_pypiname=html2md
pkgver=0.1.7
pkgrel=1
pkgdesc="HTML to Markdown converter"
url="https://github.com/davidcavazos/html2md"
depends=('python' )
makedepends=('python' 'python-pyquery')
license=('Apache')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/h/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "requirements.txt")
md5sums=('9faf9fb6b103fa6e6ed727ed0b4c6270'
         '5319822149eda4c961bfb3d43eeeb2a6')

build() {
    cp requirements.txt $srcdir/${_pypiname}-${pkgver}
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1  
}
