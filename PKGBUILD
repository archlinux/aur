# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=emsdk
pkgver=2.0.13
pkgrel=1
pkgdesc='The Emscripten SDK'
arch=('x86_64')
url='https://kripken.github.io/emscripten-site/'
license=('MIT')
depends=('python' 'cmake')
source=("https://github.com/emscripten-core/emsdk/archive/${pkgver}.tar.gz"
        'emsdk.sh')
sha256sums=('1bacabdfa07e8565f269e99bcdfa13bf832d6fa64a784a40114deaca45572542'
            'd58940585324e582621a8ac5e28e913beee14a0b8e307f5413a6b0dcd6d2a139')

package()
{
    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 emsdk.sh "$pkgdir/usr/bin/emsdk"

    cd "$srcdir/emsdk-${pkgver}"

    install --mode 755 --directory "$pkgdir/usr/lib/$pkgname"
    for file in emsdk emsdk.py emsdk_manifest.json emscripten-releases-tags.txt emsdk_env.*; do
        install --mode 755 "$file" "$pkgdir/usr/lib/$pkgname"
    done
}
