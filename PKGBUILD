# Maintainer: Craig Barnes <cr@igbarn.es>
# Contributor: Leon Belmont <meow AT linux DOT cn>

pkgname=tweak-hexeditor
_pkgname=tweak
pkgdesc='Efficient command line hex editor'
pkgver=3.02
pkgrel=1
arch=('i686' 'x86_64')
depends=('ncurses' 'glibc')
makedepends=('make' 'gcc')
url='http://www.chiark.greenend.org.uk/~sgtatham/tweak'
license=('MIT')
source=("http://www.chiark.greenend.org.uk/~sgtatham/tweak/tweak-$pkgver.tar.gz")
md5sums=('d50e20d9ed05d7cc5eb04ff3f0bf1d9b')
sha1sums=('619c2dcb54dfbbff89576d6b34d5483a8642e635')

build() {
    cd "tweak-$pkgver"
    make
}

package() {
    cd "tweak-$pkgver"
    make install PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1"
    install -Dm 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
