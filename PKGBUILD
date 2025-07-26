# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname='python-slowapi'
_module='slowapi'
_src_folder='slowapi-0.1.9'
pkgver='0.1.9'
pkgrel=2
pkgdesc="A rate limiting extension for Starlette and Fastapi"
url="https://github.com/laurents/slowapi"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/a0/99/adfc7f94ca024736f061257d39118e1542bade7a52e86415a4c4ae92d8ff/slowapi-0.1.9.tar.gz")
sha256sums=('639192d0f1ca01b1c6d95bf6c71d794c3a9ee189855337b4821f7f457dddad77')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
