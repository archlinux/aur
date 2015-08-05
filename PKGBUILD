# Maintainer: Aaron Abbott <aabmass at gmail dot com>
pkgname=mycli
pkgver=1.2.0
pkgrel=1
pkgdesc='CLI for MySQL Database. With auto-completion and syntax highlighting.'
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}"
license=('BSD')
groups=()
# these dependencies are pulled from this package's setup.py
depends=('python' 'python-click' 'python-pygments' 'python-prompt_toolkit' 'python-pymysql' 'python-sqlparse' 'python-configobj')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/m/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1035b0ca37ec01bd6b470e5e146b05db')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1
}
