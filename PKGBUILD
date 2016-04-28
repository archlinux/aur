# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Ivan Shapovalov <intelfx100 at gmail dot com>

_pkgname=libfilteraudio
pkgname=libfilteraudio
pkgver=0.0.0.r92
_commit=612c5a102550c614e4c8f859e753ea64c0b7250c
pkgrel=1
pkgdesc="An easy to use audio filtering library made from webrtc code"
arch=('i686' 'x86_64')
url="https://github.com/irungentoo/filter_audio"
license=('BSD')
makedepends=('git')
depends=('glibc')
provides=("${_pkgname}" 'filter_audio')
conflicts=("${_pkgname}" 'filter_audio')
source=(
    "${_pkgname}::git+https://github.com/irungentoo/libfilteraudio.git#commit=$_commit"
    'LICENSE'
)
sha512sums=('SKIP'
            'ab7ea75c03fab3dfc5d452f04a38b42783f646c2e0acaf8494628bfdf6f83e4b04d470e019385de3e89dd57eb8ef6d02daa6256d4ff311cc66f3999b694ef143')

build() {
    cd ${_pkgname}
    make
}

package() {
    cd ${_pkgname}
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
