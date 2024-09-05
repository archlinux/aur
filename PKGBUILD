# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Raymond W. Ko <r   a y     m  o nd DOT  w DOT k  o AT g  m ai l DOT COM>
_python=python
_distname=docx
pkgname=$_python-$_distname
pkgver=1.1.2
pkgrel=2
pkgdesc="A Python library for creating and updating Microsoft Word (.docx) files"
arch=(any)
url="https://github.com/python-openxml/python-docx"
license=('MIT')
depends=('python' 'python-lxml' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/python-openxml/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('b86345b5a408a651434c3dd89e368dec')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir=${pkgdir} dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
