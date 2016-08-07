# Maintainer: Aaron Abbott <aabmass at gmail dot com>
pkgname=mycli
pkgver=1.8.0
pkgrel=1
pkgdesc='CLI for MySQL Database. With auto-completion and syntax highlighting.'
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}"
license=('BSD')
groups=()
# these dependencies are pulled from this package's setup.py
depends=('python' 'python-crypto' 'python-click' 'python-pygments' 'python-prompt_toolkit' 'python-pymysql' 'python-sqlparse=0.1.19' 'python-configobj')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)

# source is broken on pypi for some reason since 1.7.0... hard code instead
# source=("https://pypi.python.org/packages/source/m/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/c7/12/782d85bd32dfa24a977dcc9a35b3cdd76b8cd33b58b78897f377d988f869/mycli-1.8.0.tar.gz")
md5sums=('114ae038fb74e8d0ea7296d92a48eb0a')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1
}
