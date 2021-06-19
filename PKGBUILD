# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pygtrie-git"
pkgver=2.2.r1.g64ee083
pkgrel=1
pkgdesc="Python library implementing a trie data structure. Only builds the Python 3 version"
url="https://github.com/google/pygtrie"
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
