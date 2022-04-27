# Maintainer: CharlieHogger <charliehogger31@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=emsdk
pkgver=3.1.9
pkgrel=3
pkgdesc='The Emscripten SDK'
arch=('x86_64')
url='https://kripken.github.io/emscripten-site/'
license=('MIT')
depends=('python' 'cmake')
source=("https://github.com/emscripten-core/emsdk/archive/${pkgver}.tar.gz"
        'emsdk'
        'emsdk_env.sh')
sha256sums=('99de90a1827044c5430b926db947bcb266c8bdab1a0f20fe34a62431d9174376'
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
