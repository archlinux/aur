# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiosmb
_pkgname=aiosmb
pkgver=0.4.10
pkgrel=1
pkgdesc="Fully asynchronous SMB library written in pure python."
url="https://github.com/skelsec/aiosmb"
arch=('any')
license=('MIT')
depends=('python' 'python-minikerberos' 'python-winsspi' 'python-asysocks'
	 'python-prompt_toolkit' 'python-winacl' 'python-six' 'python-tqdm'
	 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b8de656e1b8fb7d6b1a766534f10e01ee0d1c254235c03449063e04092f5a3dd')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
