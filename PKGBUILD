pkgname='python-pyrfc6266'
_module='pyrfc6266'
_src_folder='pyrfc6266-1.0.2'
pkgver='1.0.2'
pkgrel=1
pkgdesc="RFC6266 implementation in Python"
url="https://github.com/JohnDoee/pyrfc6266"
depends=('python' 'python-pyparsing')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/74/ef/693fe33d34317facaf26a5716f965dac492d0f47e56e90bf310d7d4e74df/pyrfc6266-1.0.2.tar.gz")
sha256sums=('3c41616b6a1f2e9a26df7f005fbaa634f960121769ccc4445acfb404e9f8fd4c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
