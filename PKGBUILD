# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# k8 can only be built from source against a fully compiled node.js tree, so
# upstream's own precompiled Linux release is packaged instead.

pkgname=k8-bin
pkgver=1.2
pkgrel=1
pkgdesc="Javascript shell based on V8"
arch=('x86_64')
url="https://github.com/attractivechaos/k8"
license=('MIT')
depends=('glibc')
provides=('k8')
conflicts=('k8')
source=("k8-$pkgver.tar.bz2::$url/releases/download/v$pkgver/k8-$pkgver.tar.bz2")
sha256sums=('a86b160a82f3233a21235d21170f3719a600dbd96bf1ec705a6eb57d770953c9')

package() {
    cd "$srcdir/k8-$pkgver"
    install -Dm755 k8-x86_64-Linux "$pkgdir/usr/bin/k8"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
