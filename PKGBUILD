# Maintainer: K_Lar <zan.sprogar@gmail.com>
pkgname=brem
pkgver=1.1
pkgrel=1
pkgdesc="basic notes/reminders management program that's written in POSIX sh"
arch=('any')
url="https://gitlab.com/k_lar/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('brem-git')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('2529c1aee9c087bb7e417797fbb958529867bb119890ed9ef24b94fee2dd9f5f')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
