# Maintainer: K_Lar <zan.sprogar@gmail.com>
pkgname=brem
pkgver=1.0
pkgrel=1
pkgdesc="basic notes/reminders management program that's written in POSIX sh"
arch=('any')
url="https://gitlab.com/k_lar/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('brem-git')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('62418716b90d18869d4613d46576843ba86c631f34d35469709150ff8210827f')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
