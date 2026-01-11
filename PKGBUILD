# Maintainer: Christos Longros chris.longros@gmail.com

pkgname=python-genanki
pkgver=0.13.1
pkgrel=1
pkgdesc="A Python 3 library for generating Anki decks"
arch=('any')
url="https://github.com/kerrickstaley/genanki"
license=('MIT')
depends=(
    'python'
    'python-cached-property'
    'python-frozendict'
    'python-chevron'
    'python-yaml'
    'python-pytest-runner'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/g/genanki/genanki-${pkgver}.tar.gz")
sha256sums=('84d090423a8879520465bfe9784083edacb8d35e2ba511fa5a1bdef01d8f71ed')

build() {
    cd "genanki-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "genanki-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
