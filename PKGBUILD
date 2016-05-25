# Maintainer: Aaron Abbott <aabmass at gmail dot com>
pkgname=mycli
pkgver=1.7.1
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
source=("https://pypi.python.org/packages/e3/40/1b8d4bd329372a9a448831ff0777b218cf3e0aec9b7954d5cca8c2b19926/mycli-1.7.1.tar.gz")
md5sums=('016facc75d562ce41e4dd3242f918c6a')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1
}
