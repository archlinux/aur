# Maintainer: William Turner <willtur.will@gmail.com>

_name=ledgercomm
pkgname=python-ledgercomm
pkgver=1.2.1
pkgrel=1
pkgdesc="Library to communicate with Ledger Nano S/X and Speculos."
arch=('any')
url="https://github.com/LedgerHQ/ledgercomm"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build'
             'python-installer'
             'python-setuptools-scm>=6.2'
             'python-setuptools>=45'
             'python-tomli'
             'python-wheel')
optdepends=('python-hidapi>=0.9.0.post3: HID interface communication')
source=("${_name}-${pkgver}::git+https://github.com/LedgerHQ/${_name}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" \
    "./dist/${_name}-${pkgver}-py3-none-any.whl"
}
