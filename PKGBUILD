# Maintainer: Craig Barnes <cr@igbarn.es>
# Contributor: Leon Belmont <meow AT linux DOT cn>

pkgname=tweak-hexeditor
pkgdesc='Efficient command line hex editor'
pkgver=3.02
pkgrel=2
arch=('i686' 'x86_64')
depends=('ncurses' 'glibc')
makedepends=('make' 'gcc')
url='https://www.chiark.greenend.org.uk/~sgtatham/tweak/'
license=('MIT')
source=("https://www.chiark.greenend.org.uk/~sgtatham/tweak/tweak-$pkgver.tar.gz")
md5sums=('d50e20d9ed05d7cc5eb04ff3f0bf1d9b')
sha1sums=('619c2dcb54dfbbff89576d6b34d5483a8642e635')
sha256sums=('5b4c19b1bf8734d1623e723644b8da58150b882efa9f23bbe797c3922f295a1a')

build() {
    cd "tweak-$pkgver"
    make
}

package() {
    cd "tweak-$pkgver"
    make install PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1"
    install -Dm 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
