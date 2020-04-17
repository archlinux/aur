# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Maintainer: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname=mkdocs-material
pkgver=5.1.1
pkgrel=1
pkgdesc="Material design theme for MkDocs"
arch=("any")
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
depends=("mkdocs" "python-pygments" "pymdown-extensions" "python-mkdocs-minify-plugin")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=('299d15a9b567a956348998017cce6dc9654e3cdb008ab6d8b11b89891224af1e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
