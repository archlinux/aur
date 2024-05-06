# Maintainer HLFH <gaspard@dhautefeuille.eu>
pkgname=python310-pip
pkgver=24.0
pkgrel=2
pkgdesc="A tool for installing and managing Python packages (for Python 3.10)"
arch=('any')
url="https://pip.pypa.io/"
license=('MIT')
depends=('python310')
b2sums=('SKIP')

source=("https://bootstrap.pypa.io/get-pip.py")

package() {
    cd "$srcdir"
    python3.10 get-pip.py --root="$pkgdir/" --prefix=/usr --no-warn-script-location
    cd "${pkgdir}/usr/bin/"
    rm pip3 pip
    mv wheel wheel3.10
}
