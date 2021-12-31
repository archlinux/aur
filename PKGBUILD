# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=tpm_futurepcr
pkgver=1.4
pkgrel=1
pkgdesc='Calculate future TPM PCRs after a kernel upgrade'
arch=('any')
url="https://github.com/grawity/${pkgname}"
license=('MIT')
depends=('python' 'python-signify' 'tpm2-tools')
makedepends=('python-setuptools')

source=("https://github.com/grawity/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('718f4a0a92db95e3d5d92da63fe1d1f003cad4598381e939e0384ca54501be12')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
