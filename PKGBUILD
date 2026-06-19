pkgname='python-annotatedyaml'
pkgver='1.0.2'
_module='annotatedyaml'
_src_folder="annotatedyaml-${pkgver}"
pkgrel=1
pkgdesc="Annotated YAML that supports secrets for Python"
url="None"
depends=('python')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/ec/4b/973067092ee348e331d125acd60c45245f11663373c219650814b43d0025/annotatedyaml-1.0.2.tar.gz")
sha256sums=('f9a49952994ef1952ca17d27bb6478342eb1189d2c28e4c0ddbbb32065471fb0')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
