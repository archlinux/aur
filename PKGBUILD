# Maintainer: Agent_Krtek <hermpe@gmail.com>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: Zuf <kontakt.zuf@gmail.com>

pkgname=anttweakbar
pkgver=1.16
pkgrel=8
pkgdesc="C/C++ lib that allows programmers to quickly add a light and intuitive GUI into graphic apps to interactively tweak their params"
arch=('i686' 'x86_64')
url="http://anttweakbar.sourceforge.net"
license=('zlib')
depends=('gcc-libs' 'glu')
options=('staticlibs')
source=("http://ufpr.dl.sourceforge.net/project/anttweakbar/AntTweakBar_116.zip")
md5sums=('4349a13c0b5a493cf5b6b0757f3e7f0d')

build() {
    cd "AntTweakBar"

    make -C src
}

package() {
    cd "AntTweakBar"

    install -dm755 "$pkgdir"/usr/{share/licenses/$pkgname,include,lib}

    install -m644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
    install -m644 include/AntTweakBar.h "$pkgdir/usr/include/AntTweakBar.h"
    install -m755 lib/libAntTweakBar.so "$pkgdir/usr/lib/libAntTweakBar.so.$pkgver"
    install -m644 lib/libAntTweakBar.a "$pkgdir/usr/lib/libAntTweakBar.a"

    ln -s "libAntTweakBar.so.$pkgver" "$pkgdir/usr/lib/libAntTweakBar.so"
    ln -s "libAntTweakBar.so.$pkgver" "$pkgdir/usr/lib/libAntTweakBar.so.1"
}
