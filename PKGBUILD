# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Massimino <mass at gmx dot se>
# Contributor: pancho horrillo <pancho at pancho dot name>
# Contributor: Ray Hogenson <rayhogenson at gmail dot com>

pkgname=par
pkgver=1.53.0
pkgrel=2
pkgdesc='Paragraph reformatter'
url='https://bitbucket.org/amc-nicemice/par'
arch=(x86_64 i686 aarch64 armv7h)
license=('LicenseRef-unknown')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/get/$pkgver.tar.gz")
sha512sums=('61bf0286f9c0ae21bc6f73c50f0f9ea3dce57293445086a20d63d36b5d613f91e89e3b69e3b390bfdfd9dc37ec51160d167ed8f5ec37ada6e0828fd348bd8f2e')

build() {
    cd amc-nicemice-par-eb0590f6bafc
    make -f protoMakefile CC="cc $CFLAGS -std=c99 -D_GNU_SOURCE -c" LINK1="cc $LDFLAGS"
}

package() {
    cd amc-nicemice-par-eb0590f6bafc
    install -Dm755 -D par       -t "$pkgdir/usr/bin/"
    install -Dm644 -D par.1     -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 -D par.doc   -t "$pkgdir/usr/share/licenses/$pkgname/"
}
