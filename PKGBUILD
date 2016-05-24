# Maintainer: Aaron Abbott <aabmass at gmail dot com>
pkgname=mycli
pkgver=1.7.0
pkgrel=1
pkgdesc='CLI for MySQL Database. With auto-completion and syntax highlighting.'
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}"
license=('BSD')
groups=()
# these dependencies are pulled from this package's setup.py
depends=('python' 'python-crypto' 'python-click' 'python-pygments' 'python-prompt_toolkit' 'python-pymysql' 'python-sqlparse' 'python-configobj')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)

# source is broken on pypi for some reason in 1.7.0... hard code instead
# source=("https://pypi.python.org/packages/source/m/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/f8/8a/9f024656457cfb2afd19f93c3478f45c22a5599ebb24e04262a40d9171af/mycli-1.7.0.tar.gz")
md5sums=('8d450538ec991392d6c9f86f5e3ddd6d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1
}
