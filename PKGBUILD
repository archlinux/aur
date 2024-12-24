pkgname='python-starlette-context'
_module='starlette-context'
_src_folder='starlette_context-0.3.6'
pkgver='0.3.6'
pkgrel=1
pkgdesc="Middleware for Starlette that allows you to store and access the context data of a request. Can be used with logging so logs automatically use request headers such as x-request-id or x-correlation-id."
url="https://github.com/tomwojcik/starlette-context"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/a8/21/aa5d3848fcb77f0e7c9f1844271826ff74d83fad9920ca7f8105e0dc02ee/starlette_context-0.3.6.tar.gz")
sha256sums=('d361a36ba2d4acca3ab680f917b25e281533d725374752d47607a859041958cb')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
