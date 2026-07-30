# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=leaves-bin
_pkgname=leaves
pkgver=0.2.0
pkgrel=1
pkgdesc='A text-mode disk usage visualization utility.'
arch=(
    'x86_64'
)
url='https://github.com/patonw/leaves'
license=('MPL-2.0')
options=(
    !debug
    !lto
)
provides=('leaves')
conflicts=('leaves-git' 'leaves')
source=(
    "${_pkgname}-${pkgver}-bin::${url}/releases/download/v${pkgver}-cross/leaves-v${pkgver}-cross-x86_64-linux"
    "${_pkgname}-LICENSE-${pkgver}::https://raw.githubusercontent.com/patonw/leaves/refs/tags/v$pkgver-cross/LICENSE"
)
sha256sums=(
    '1e3e53c33b189c473cbf734c207aac3655ca4e58d9558f94d56de396eb6be773'
    'd8d2562a7cb68ffdfe91fc66af1ed4a8a4e272aa4ab59bea7451ba34b9aba3d4'
)

package() {
    install -Dm0755 leaves-"${pkgver}"-bin  "$pkgdir/usr/bin/leaves"
    install -Dm644 "${_pkgname}"-LICENSE-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
