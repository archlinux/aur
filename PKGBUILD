# Maintainer: Matthew Gamble

pkgname=garchdeps-git
pkgver=2013.09.21
pkgrel=1
pkgdesc="Tool that shows dependencies of Arch Linux packages in a graphical format"
arch=('any')
url="http://bruno.adele.im/projets/garchdeps"
license=('GPL3')
# Previously graphviz was a hard dependency. This was unnecessary, as the script
# does not call any graphviz binaries directly as far as I can tell. It just generates
# files that can be processed by the dot binary.
depends=('python')
makedepends=('git')
optdepends=('graphviz')
source=('git://github.com/badele/garchdeps.git')
sha256sums=('SKIP')

pkgver() {
    cd "garchdeps"
    git log -1 --format=format:%cd --date=short | sed 's|-|.|g'
}

package(){
    cd "$srcdir/garchdeps"
    install -Dm 755 garchdeps.py $pkgdir/usr/bin/garchdeps.py
}
