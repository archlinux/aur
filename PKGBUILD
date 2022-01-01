# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname=x11-keyboard-flags
pkgver=1.0.0
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
sha512sums=('5054e4e22f6af4e46a41376960f4caee69d4f3627e47dff088699f710c296ebaf7013ca15b514677f9bcf463927c25aae0528e6fbe4d1854d33023478adc1ade')

package() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p $pkgdir/usr/{lib/$pkgname,bin} && cp flags.json main.py $pkgdir/usr/lib/$pkgname
    ln -s /usr/lib/$pkgname/main.py $pkgdir/usr/bin/x11-keyboard-flags
}
