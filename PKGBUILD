# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Maintainer: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname=mkdocs-material
pkgver=5.0.1
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions" "python-mkdocs-minify-plugin")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=('d71832153dd0ed6a097f730ab3d8597df4e8560b1ea39d68723a7da80cbcb671')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
