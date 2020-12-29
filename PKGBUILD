# Maintainer: AlphaJack <alpha at tuta dot io>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname="python-opentimestamps-git"
pkgver=0.4.1.r3.g5ac3b06
pkgrel=1
pkgdesc="Python3 library for creating and verifying OpenTimestamps proofs"
license=("LGPL3")
arch=("any")
provides=("python-opentimestamps")
url="https://github.com/opentimestamps/python-opentimestamps"
depends=("python-bitcoinlib" "python-pysha3")
makedepends=("git" "python-setuptools")
checkdepends=("python-gitpython")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "python-opentimestamps"
 git describe --long --tags | sed 's/^python-opentimestamps-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
 cd "python-opentimestamps"
 python setup.py build
}

check(){
 cd "python-opentimestamps"
 python -m unittest discover -v
}

package(){
 cd "python-opentimestamps"
 python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
