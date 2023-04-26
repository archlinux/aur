# Maintainer: Charles L <charles@crwl.org>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=emsdk
pkgver=3.1.37
pkgrel=1
pkgdesc='The Emscripten SDK'
arch=('x86_64')
url='https://kripken.github.io/emscripten-site/'
license=('MIT')
depends=('python' 'cmake')
source=("https://github.com/emscripten-core/emsdk/archive/${pkgver}.tar.gz"
        'emsdk'
        'emsdk_env.sh')
sha256sums=('c3c80dfe82fb448751d1c48200e5143aeca0f0db1d021db4b63655a9d9470cd8'
            'd58940585324e582621a8ac5e28e913beee14a0b8e307f5413a6b0dcd6d2a139'
            'cd14a9107ca2cd92ec7ab2e44b8ca86ae71e81e744d700b49e75fbcb9717b5ce')

package()
{
    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 emsdk emsdk_env.sh "$pkgdir/usr/bin/"

    cd "$srcdir/emsdk-${pkgver}"

    install --mode 755 --directory "$pkgdir/usr/lib/$pkgname"
    for file in emsdk emsdk.py *.json *.txt emsdk_env.*; do
        install --mode 755 "$file" "$pkgdir/usr/lib/$pkgname"
    done
}
