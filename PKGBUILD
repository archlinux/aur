# Maintainer HLFH <gaspard@dhautefeuille.eu>
pkgname=python311-pip
pkgver=24.0
pkgrel=3
pkgdesc="A tool for installing and managing Python packages (for Python 3.11)"
arch=('any')
url="https://pip.pypa.io/"
license=('MIT')
depends=('python311')
source=("https://bootstrap.pypa.io/get-pip.py")
b2sums=('ca8c5e63b06df23d98f2fae5ba02b47e627eed5d40f43d515dffeb817e0a27d673416a1668c4fcec345c508fdf633a109bfb05330df1abe7172142845170f6f7')

package() {
    cd "$srcdir"
    python3.11 get-pip.py --root="$pkgdir/" --prefix=/usr --no-warn-script-location
    cd "${pkgdir}/usr/bin/"
    rm pip3 pip
    mv wheel wheel3.11
}
