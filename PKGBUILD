# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# COntributor: Ilan Frumer (ilanfrumer@gmail.com)

_appname=dragonfly
pkgname=${_appname}-bin
pkgver=1.27.2
pkgrel=1
pkgdesc="Dragonfly is a modern in-memory datastore, fully compatible with Redis and Memcached APIs"
arch=("x86_64" "aarch64")
url="https://dragonflydb.io/"
license=('BUSL-1.1')
depends=('zlib' 'glibc')
source=("https://github.com/dragonflydb/${_appname}/releases/download/v${pkgver}/${_appname}-${arch}.tar.gz")
sha256sums=('55c028f04c16067bc2b57b02f12cf08468b8270277b7346c384af4e7954f941f')

package() {
    install -Dm755 "${_appname}-${CARCH}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
