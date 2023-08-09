# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-loggers
pkgname=python-${_pkgname}
pkgver=1.0.4
pkgrel=1
pkgdesc="Logging utilities for spaCy"
arch=(x86_64 aarch64)
url="https://github.com/explosion/spacy-loggers"
license=(MIT)
depends=()
makedepends=(
    python-setuptools
)
source=(
    "https://github.com/explosion/${_pkgname}/archive/refs/tags/v${pkgver}.zip"
)
b2sums=("9e668a735b04fa24d51c39cce4cf01572f9257f4c5e1d0031992ff6054ba74685167422b5313bcc4284b3820d9b4243e9d42b730b319769a2082dba8f4512036")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
