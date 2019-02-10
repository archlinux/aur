# Maintainer: adrusi <adrian at adrusi dot com>

pkgname=terra-bin
provides=(terra)
conflicts=(terra)
pkgver=1.0.0beta1
pkgrel=2
pkgdesc='A low-level system programming language that is embedded in and meta-programmed by the Lua programming language'
arch=('x86_64')
url='http://terralang.org/'
license=('MIT')
depends=('readline' 'ncurses5-compat-libs' 'llvm6-libs')
source=('https://github.com/zdevito/terra/releases/download/release-1.0.0-beta1/terra-Linux-x86_64-2e2032e.zip')
md5sums=('2200774fe32f1b54d10aee2c23081a86')

package() {
    cd "$srcdir/terra-Linux-x86_64-2e2032e"
    mkdir -p "$pkgdir"/usr/{lib,include/terra}
    install -Dm644 include/terra/*         "$pkgdir/usr/include/terra"
    install -Dm644 lib/*                   "$pkgdir/usr/lib"
    install -Dm644 share/terra/LICENSE.txt "$pkgdir/usr/share/licenses/terra/LICENSE"
    install -Dm755 bin/terra               "$pkgdir/usr/bin/terra"
}

