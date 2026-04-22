# Maintainer: 0x5041594f <contact@payln.casa>

pkgname=csnake
pkgver=1.9.1
pkgrel=1
pkgdesc="A simple implementation of Snake for your terminal"
arch=('x86_64')
license=('EUPL-1.2')
depends=('ncurses' 'glibc')
url='https://git.payln.casa/0x5041594f/'
source=("https://git.payln.casa/0x5041594f/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e7cf2e3c3b43034193277773ec3f34e002803a687dc23b97a2c44ef5d8ff9a89')

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

