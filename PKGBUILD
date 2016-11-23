# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Ivan Shapovalov <intelfx100 at gmail dot com>

_pkgname=filter_audio
pkgname=libfilteraudio
pkgver=0.0.1
_commit=612c5a102550c614e4c8f859e753ea64c0b7250c
pkgrel=1
pkgdesc="An easy to use audio filtering library made from webrtc code"
arch=('i686' 'x86_64')
url="https://github.com/irungentoo/filter_audio"
license=('BSD')
depends=('glibc')
provides=("${_pkgname}" 'libfilteraudio')
conflicts=("${_pkgname}" 'libfilteraudio')
source=(
    "$_pkgname-v$pkgver.tar.gz::https://github.com/irungentoo/${_pkgname}/archive/v${pkgver}.tar.gz"
    'LICENSE'
)
sha512sums=('9ae4d77ddc0c9f604642a6a968ead684affd9dc957ab4ddc3cf9974da028b9c402155322a63dbbcdb7dc8e3eec63c2fcef267862580229cfc01bc496f990ed58'
            'ab7ea75c03fab3dfc5d452f04a38b42783f646c2e0acaf8494628bfdf6f83e4b04d470e019385de3e89dd57eb8ef6d02daa6256d4ff311cc66f3999b694ef143')

build() {
    cd ${_pkgname}-$pkgver
    make
}

package() {
    cd ${_pkgname}-$pkgver
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
