# Maintainer: ItsZariep <itszariep@disroot.org>
pkgname=sglauncher-git
pkgver=r71.aaf1709
pkgrel=1
pkgdesc="A simple GTK3 application launcher"
arch=('any')
url="https://codeberg.org/ItsZariep/sglauncher"
license=('GPL3')
depends=('gtk3' )
makedepends=('git' 'gtk3')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/sglauncher/src"
echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
cd "$srcdir/sglauncher/src"
git checkout main
make
}

package() {
cd "$srcdir/sglauncher/src"
make PREFIX="$pkgdir/usr" install
}

clean() {
cd "$srcdir/sglauncher/src"
make clean
}
