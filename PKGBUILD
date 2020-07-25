# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Aneesh Raghavan <anonthenatonofnumbers@gmail.com>
pkgname=mrun
pkgver=0.0.1
pkgrel=1
pkgdesc="Clean command to run the contents of a Runfile"
arch=('any')
url="https://github.com/SealsRock12/run"
license=('GPL')
depends=('bash')
conflicts=('run')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SealsRock12/mrun/archive/${pkgver}.tar.gz")
sha256sums=("d2a27f30ba8c464fab62a18eb3080e615894a271871b9f31257bedf7680ed54a")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/run"
    cp "$srcdir/$pkgname-$pkgver/src/run" "$pkgdir/opt/run"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/run/run" "$pkgdir/usr/bin/run"
}
