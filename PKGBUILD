# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=emsdk
pkgver=1.35
pkgrel=1
pkgdesc='The Emscripten SDK'
arch=('x86_64')
url='https://kripken.github.io/emscripten-site/'
license=('BSD')
depends=('python2' 'cmake')
source=("https://s3.amazonaws.com/mozilla-games/emscripten/releases/$pkgname-portable.tar.gz"
        'emsdk.sh')
sha256sums=('39114f25e1b3f4d1e15dc8d8f59227c30be855e79cbff91fbf2e3f31f7bb2cd1'
            '88a64d125b390a0b00ab79abaa5ff7a73dedc734701ea3ccca265598f09e9d60')

package()
{
    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 emsdk.sh "$pkgdir/usr/bin/emsdk"

    cd "$srcdir/${pkgname}_portable"

    install --mode 755 --directory "$pkgdir/usr/lib/$pkgname"
    install --mode 755 emsdk "$pkgdir/usr/lib/$pkgname"
    install --mode 755 emsdk_manifest.json "$pkgdir/usr/lib/$pkgname"
}
