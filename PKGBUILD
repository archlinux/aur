# Maintainer: K_Lar <zan.sprogar@gmail.com>
pkgname=brem
pkgver=1.4.0
pkgrel=1
pkgdesc="basic notes/reminders management program that's written in POSIX sh"
arch=('any')
url="https://gitlab.com/k_lar/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('brem-git')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('0913c941f0def09833b221c5c267b93185d8367e7f1311cf0ff94580664549a1')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
