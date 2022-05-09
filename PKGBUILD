# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=gaalop
pkgver=2.2.5
pkgrel=1
epoch=
pkgdesc='Geometric Algebra ALgorithms OPtimizer is a software to optimize geometric algebra files.'
arch=('any')
url='http://www.gaalop.de/'
license=('GPL')
groups=()
depends=('jre-openjdk')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.gaalop.de/wp-content/uploads/$pkgname-$pkgver-bin.zip")
sha256sums=('2bb721ba76c46042a1f4c0d80c194e049d4837682141eba4697dcdeb086dbaec')

prepare() {
	unzip -o "$pkgname-$pkgver-bin.zip"
        rm -rf nativeLibraries
        find -name '*.xml' -delete
        find -name '*.zip' -delete
        find -name '*.bat' -delete
}

package() {
        mkdir -p $pkgdir/usr/share/$pkgname
	cp -rv * $pkgdir/usr/share/$pkgname
        chmod 755 -R $pkgdir/usr/share/$pkgname
}
