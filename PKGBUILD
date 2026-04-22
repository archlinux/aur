# Maintainer: 0x5041594f <contact@payln.casa>

pkgname=csnake
pkgver=1.9.2
pkgrel=1
pkgdesc="A simple implementation of Snake for your terminal"
arch=('x86_64')
license=('EUPL-1.2')
depends=('ncurses' 'glibc')
url='https://git.payln.casa/0x5041594f/'
source=("https://git.payln.casa/0x5041594f/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2f54dbbc46574b04bd0c7bc3576d34f2eecd10bf133c42757eb51c10a6a4c8d6')

build() {
        cd csnake
        echo $LDFLAGS
        make build V=1
}

package() {
        cd csnake
        pwd
        ls
        mkdir -p "$pkgdir/usr/bin"
        make DESTDIR="$pkgdir/" install
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

