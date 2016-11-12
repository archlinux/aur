# Maintainer: Austin Haedicke

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://gtbjj.com/gtbjj/pkgbuild 

_pkgname=phoronix-test-suite
pkgname=phoronix-test-suite-git
pkgver=v6.6.1.20.g01b3030
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.phoronix-test-suite.com/"
depends=('ruby' 'python')
makedepends=('git')
optdepends=('php' 'php-gtk')
provides=('phoronix-test-suite')
conflicts=('phoronix-test-suite')
install=$pkgname.install
source=("git://github.com/phoronix-test-suite/phoronix-test-suite.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed -e 's|-|.|g'
}

package() {
    cd $srcdir/$_pkgname
    sudo ./install-sh
}
