# Maintainer: Hyacinthe Cartiaux < hyacinthe dot cartiaux at free dot fr >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: valère monseur <valere dot monseur at ymail dot com>

_name="livereload"
_module="${_name}"

pkgname="python-${_module}"
pkgver="2.6.3"
pkgrel="1"
pkgdesc="An awesome tool for web developers."
arch=("any")
url="https://github.com/lepture/python-livereload"
license=("BSD")
depends=("python-six" "python-tornado")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('776f2f865e59fde56490a56bcc6773b6917366bce0c267c60ee8aaf1a0959869')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

