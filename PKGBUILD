# Maintainer: payoliin <payoliin@protonmail.com>

pkgname=csnake
pkgver=1.7
pkgrel=1
pkgdesc="A simple implementation of Snake for your terminal"
arch=('x86_64')
license=('EUPL-1.2')
depends=('ncurses' 'glibc')
url='https://gitlab.com/payoliin/csnake/'
source=("https://gitlab.com/payoliin/${pkgname}/-/archive/v${pkgver}/csnake-${pkgver}.tar.gz")
sha256sums=('4eb380fd1f7225f147c1f3262662c361379c93145fc03cb4c9fd27c6b428404c')

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

