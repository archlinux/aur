# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pygtrie-git"
pkgver=2.4.2.r0.g0c8b2b6
pkgrel=1
pkgdesc="Python library implementing a trie data structure. Only builds the Python 3 version"
url="https://github.com/mina86/pygtrie"
license=("Apache")
arch=("any")
provides=("python-pygtrie" "python-pygtrie-git")
conflicts=("python-pygtrie")
depends=("python")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "pygtrie"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build(){
 cd "pygtrie"
 python setup.py build
}

package(){
 cd "pygtrie"
 python setup.py install --root="$pkgdir" --optimize=1
}
