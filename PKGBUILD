# Maintainer HLFH <gaspard@dhautefeuille.eu>
pkgname=python311-pip
pkgver=24.0
pkgrel=2
pkgdesc="A tool for installing and managing Python packages (for Python 3.11)"
arch=('any')
url="https://pip.pypa.io/"
license=('MIT')
depends=('python311')

source=("https://bootstrap.pypa.io/get-pip.py")

package() {
    cd "$srcdir"
    python3.11 get-pip.py --root="$pkgdir/" --prefix=/usr --no-warn-script-location

    # Keep symbolic links for pip3.12 as Python 3.12 is the default on Arch Linux
    ln -sf pip3.12 "${pkgdir}/usr/bin/pip3"
    ln -sf pip3.12 "${pkgdir}/usr/bin/pip"
}

b2sums=('SKIP')
