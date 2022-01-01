# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname=x11-keyboard-flags
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="X11 Keyboard layout indicator as country flags"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/jonathas/x11-keyboard-flags"
license=('GPL3')
groups=()
depends=('python' 'xkeyboard-config')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/jonathas/x11-keyboard-flags/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7b00feabb3009a27c48d52b350502eb6ce6944c54a76f2fdb31b8c7f8b7ad3e9cd15203050e77802bf7f870316669099a427c3ca84fc4a48c9e6bd98837b0432')

package() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p $pkgdir/usr/{lib/$pkgname,bin} && cp flags.json main.py $pkgdir/usr/lib/$pkgname
    ln -s /usr/lib/$pkgname/main.py $pkgdir/usr/bin/x11-keyboard-flags
}
