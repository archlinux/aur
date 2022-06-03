# Maintainer: Dicebot <public@dicebot.lv>
pkgname=dstep
pkgver=1.0.3
pkgrel=1
pkgdesc="Automatic C header to D module translator"
arch=('x86_64')
groups=('dlang')
url="https://github.com/jacob-carlborg/dstep"
license=('custom')
depends=('clang' 'liblphobos')
makedepends=('git' 'dub' 'ldc' 'liblphobos')
source=(
    "git+https://github.com/jacob-carlborg/dstep.git#tag=v$pkgver"
    "http://www.boost.org/LICENSE_1_0.txt"
)
sha1sums=(
    'SKIP'
    '3cba29011be2b9d59f6204d6fa0a386b1b2dbd90'
)

build ()
{
    cd $srcdir/dstep
    dub upgrade
    dub build
}

package ()
{
    mkdir -p $pkgdir/usr/bin
    install -m755 $srcdir/dstep/bin/dstep $pkgdir/usr/bin/dstep
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -m644 $srcdir/LICENSE_1_0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
