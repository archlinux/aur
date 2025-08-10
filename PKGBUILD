# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=cb3sum
pkgver=0.1.3
pkgrel=1
pkgdesc='BLAKE3 checksums'
url='https://codeberg.org/coralpink/cb3sum'
arch=('x86_64' 'aarch64')
license=('LicenseRef-MIT+NIGGER')
depends=('glibc' 'libblake3')
source=(
    "$pkgname-$pkgver.tar.gz::https://codeberg.org/coralpink/cb3sum/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://codeberg.org/coralpink/cb3sum/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
b2sums=(
    '630f2ed9fbce4df8752f925298cde96b041feda8132221aef36ae959333acd3d9e3596b763c132d852991e2e7f21b2246563c11a30f72368203b655c47ea336e'
    '6b4fa3c3f1f07a550f7b7f97a27954b98406f270bd8b0cb81a8c1f4a2bb3affe3662b7dc74c5c8b82faa87285d501b024639e2460ee3c618ca18a29d2224d7bd' 
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}
