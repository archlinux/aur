# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkwidgets')
pkgver=0.12.0
pkgrel=1
pkgdesc="Collection of widgets for Tkinter's ttk extensions"
_name=ttkwidgets
arch=('any')
url="https://github.com/RedFantom/ttkwidgets"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RedFantom/$_name/archive/${pkgver}.tar.gz")
sha512sums=('0face6cbb3d40f20c70d848c39c11b460a53a0866536e879c14d5b69d59e18414b54bcad163753481df9bc7ec226308774287b91ee2cdd2826e383b783fc4e93')
makedepends=('python-setuptools')
depends=('tk' 'python-pillow')
checkdepends=(python-pytest)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    pytest -v
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
