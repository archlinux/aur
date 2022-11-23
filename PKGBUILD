# Maintainer: K_Lar <zan.sprogar@gmail.com>
pkgname=brem
pkgver=1.3.1
pkgrel=1
pkgdesc="basic notes/reminders management program that's written in POSIX sh"
arch=('any')
url="https://gitlab.com/k_lar/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('brem-git')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('7fc6bfeaf50535f4725e340f0ce15091a8d7c695fdd33a23c2682b9733a332a9')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
