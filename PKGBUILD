# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=tpm_futurepcr
pkgver=1.3.1
pkgrel=1
pkgdesc='Calculate future TPM PCRs after a kernel upgrade'
arch=('any')
url="https://github.com/grawity/${pkgname}"
license=('MIT')
depends=('python' 'python-signify' 'python-pyasn1-modules' 'tpm2-tools')
makedepends=('python-setuptools')

source=("https://github.com/grawity/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2ef3e6888c20acc9e44c3144a8832b1d03d1c48a2e3429061f64afe024283bd8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
