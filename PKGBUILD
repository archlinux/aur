# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=tpm_futurepcr
pkgver=1.2.1
pkgrel=1
pkgdesc='Calculate future TPM PCRs after a kernel upgrade'
arch=('any')
url="https://github.com/grawity/${pkgname}"
license=('MIT')
depends=('python' 'python-signify' 'tpm2-tools')
makedepends=('python-setuptools')

source=("https://github.com/grawity/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0050e2c6b25d6725c3ff5e7f1f7c8bbd8b9197ca5f3b46e8c691eb4344191be4')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
