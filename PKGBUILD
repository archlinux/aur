# Maintainer: Raj singh chauhan <rajsinghchauhan352@gmail.com>
pkgname=archclean
pkgver=0.1.13
pkgrel=1
pkgdesc="A CLI tool for safely cleaning Arch Linux systems."
arch=('any')
url="https://github.com/rajchauhan28/archClean"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-sh' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rajchauhan28/archClean/archive/v${pkgver}.tar.gz")
sha256sums=('2098c09a79b296ead4551661092a447a3ca20958963ebd31a4e3a5d05ecc0b18')

build() {
    cd "${srcdir}/archClean-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/archClean-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    
    # Install license if available (assuming LICENSE file exists)
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
