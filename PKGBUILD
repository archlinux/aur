# Maintainer: ugla <ugla at u8 dot is>
pkgname=passphrase
pkgrel=1
pkgver=1.6
pkgdesc="Small, simple passphrase generator, written in Zig"
arch=('any')
url="https://git.sr.ht/~alva/${pkgname}"
license=('MIT')
makedepends=('zig>=0.10.1' 'git')
source=("git+https://git.sr.ht/~alva/${pkgname}#tag=${pkgver}")
sha256sums=('SKIP')

check() {
    cd "${srcdir}/${pkgname}"
    zig build test
}

package() {
    cd "${srcdir}/${pkgname}"
    zig build install -Doptimize=ReleaseSmall -Dpie=true --prefix "${pkgdir}/usr"
}
