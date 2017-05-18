# Maintainer: Aaron Abbott <aabmass at gmail dot com>
pkgname=mycli
pkgver=1.10.0
pkgrel=1
pkgdesc='CLI for MySQL Database. With auto-completion and syntax highlighting.'
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}"
license=('BSD')
groups=()
# these dependencies are pulled from this package's setup.py
depends=('python' 'python-crypto' 'python-click' 'python-pygments'
'python-prompt_toolkit' 'python-pymysql' 'python-sqlparse'
'python-configobj' 'python-pycryptodome')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)

# source is broken on pypi for some reason since 1.7.0... hard code instead
# source=("https://pypi.python.org/packages/source/m/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/d3/ba/13b9ca22e77fbe6770c39c6fae912ec2fe95bbbbcc7b1ed287851f04c438/mycli-1.10.0.tar.gz")
md5sums=('0d94c0868b8e3488f39df66cb12bc46b')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1
}
