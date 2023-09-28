# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypykatz
_pkgname=pypykatz
pkgver=0.6.8
pkgrel=1
pkgdesc="Partial Mimikatz implementation in pure Python."
url="https://pypi.org/project/pypykatz/"
arch=('any')
license=('MIT')
depends=('python' 'python-minidump' 'python-minikerberos' 'python-msldap'
	 'python-aiowinreg' 'python-aiosmb' 'python-aesedb' 'python-unicrypto')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b8e38f0d5971f042a090226664e43122523450130dcee87f112a08a1ad9398d3')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
