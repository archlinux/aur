# Maintainer: K_Lar <zan.sprogar@gmail.com>

_pkgname=brem
pkgname=$_pkgname-git
pkgver=r7.5cbdec9
pkgrel=1
pkgdesc="basic notes/reminders management program that's written in POSIX sh"
arch=('any')
url="https://gitlab.com/k_lar/$_pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('brem')
source=("$url/-/archive/master/$pkgname-master.tar.gz")
source=("$_pkgname::git+https://gitlab.com/k_lar/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/brem/LICENSE"
}
