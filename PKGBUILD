# Maintainer: Andrej Radović <aur@andrejradovic.com>
pkgname=nodejs-mpsm
_npmname="@mpv-easy/mpsm"
pkgver="0.1.14"
pkgrel=1
pkgdesc="MPV Plugin manager"
arch=('any')
url="https://github.com/mpv-easy/mpsm-scripts"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname#@*/}-$pkgver.tgz")
noextract=("${_npmname#@*/}-$pkgver.tgz")
sha256sums=('SKIP')

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/${_npmname#@*/}-$pkgver.tgz"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "s|$pkgdir||g"
}
