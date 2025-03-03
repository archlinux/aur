# Maintainer: payoliin <payoliin@protonmail.com>

pkgname=csnake
pkgver=1.8.2
pkgrel=1
pkgdesc="A simple implementation of Snake for your terminal"
arch=('x86_64')
license=('EUPL-1.2')
depends=('ncurses' 'glibc')
url='https://gitlab.com/payoliin/csnake/'
source=("https://gitlab.com/payoliin/${pkgname}/-/archive/v${pkgver}/csnake-${pkgver}.tar.gz")
sha256sums=('62d31505a2ec3a71161eaf727afa897c3e9577e167c552747ff6b5ff5469833c')

build() {
        cd "$pkgname-v$pkgver"* || exit 1
        echo $LDFLAGS
        make build V=1
}

package() {
        cd "$pkgname-v$pkgver"*
        mkdir -p "$pkgdir/usr/bin"
        make DESTDIR="$pkgdir/" install
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

