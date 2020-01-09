# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python-setuptools-lint'
pkgver=0.5.2
pkgrel=1
_name=setuptools-pylint
pkgdesc="Expose pylint as a lint command into setup.py"
arch=('any')
url="https://github.com/johnnoone/setuptools-pylint"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johnnoone/$_name/archive/v${pkgver}.tar.gz")
sha512sums=('3944434e3f6c0a3f6ae36ae4b1387a25ae93079d4462203c6f84f6bc2af7e2a3f8618bdf14b741234507cb788c3c33e62b3d51d2633e284c2b454ece5bb0a571')
makedepends=('python-setuptools')
depends=('python-pylint')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
