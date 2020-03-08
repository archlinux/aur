# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=tpm_futurepcr
pkgver=1.2
pkgrel=1
pkgdesc='Calculate future TPM PCRs after a kernel upgrade'
arch=('any')
url="https://github.com/grawity/${pkgname}"
license=('MIT')
depends=('python' 'python-signify' 'tpm2-tools')
makedepends=('python-setuptools')

source=("https://github.com/grawity/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6eea2b6a9f052f67df354b9badc133878a7f023340e540ad16e80966736b8d8a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
