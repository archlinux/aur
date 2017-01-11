# Maintainer: Aaron Abbott <aabmass at gmail dot com>
pkgname=mycli
pkgver=1.8.1
pkgrel=2
pkgdesc='CLI for MySQL Database. With auto-completion and syntax highlighting.'
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}"
license=('BSD')
groups=()
# these dependencies are pulled from this package's setup.py
depends=('python' 'python-crypto' 'python-click' 'python-pygments' 'python-prompt_toolkit' 'python-pymysql' 'python-sqlparse-mycli' 'python-configobj')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)

# source is broken on pypi for some reason since 1.7.0... hard code instead
# source=("https://pypi.python.org/packages/source/m/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/06/e4/748f932427af83fc9c7f3311e580476e9686c301630a3096b3e18f60a4d0/mycli-1.8.1.tar.gz")
md5sums=('4484c59b0cd3f98e37868d158886490e')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1
}
