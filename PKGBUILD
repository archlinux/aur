# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=emsdk
pkgver=1.35
pkgrel=5
pkgdesc='The Emscripten SDK'
arch=('x86_64')
url='https://kripken.github.io/emscripten-site/'
license=('MIT')
depends=('python2' 'cmake')
source=("https://s3.amazonaws.com/mozilla-games/emscripten/releases/$pkgname-portable.tar.gz"
        'emsdk.sh')
sha256sums=('b2256905258e5a3536951067fb2d878542808ae5fb100001b7e9a9196039c199'
            '88a64d125b390a0b00ab79abaa5ff7a73dedc734701ea3ccca265598f09e9d60')

package()
{
    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 emsdk.sh "$pkgdir/usr/bin/emsdk"

    cd "$srcdir/${pkgname}-portable"

    install --mode 755 --directory "$pkgdir/usr/lib/$pkgname"
    install --mode 755 emsdk "$pkgdir/usr/lib/$pkgname"
    install --mode 755 emsdk_manifest.json "$pkgdir/usr/lib/$pkgname"
}
