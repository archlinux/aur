# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=tpm_futurepcr
pkgver=1.5
pkgrel=1
pkgdesc='Calculate future TPM PCRs after a kernel upgrade'
arch=('any')
url="https://github.com/grawity/${pkgname}"
license=('MIT')
depends=('python' 'python-signify' 'tpm2-tools')
makedepends=('python-setuptools')

source=("https://github.com/grawity/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7e5fa03c2ee208af69d5c185685d022be6662c438d948318700f892ca4fd45f8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
