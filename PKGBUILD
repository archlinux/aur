# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=put
_pkgver="2.0.13-a.0"
pkgver="$(tr '-' '.' <<< $_pkgver)"
pkgrel=1
pkgdesc='A modern, featureful echo(1)'
url='https://github.com/Unlimiter/put'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$url/archive/v$_pkgver.tar.gz")
sha256sums=('a18395ff7e20c788b6b34cfb8eac56223f46bf30cf676b3666eb0d403b6b2f98')

build() {
  cd "$pkgname-$_pkgver"
  make
}

package() {
  cd "$pkgname-$_pkgver"
  make \
    DESTDIR="${pkgdir}" \
    PREFIX="/usr" \
    MANPREFIX="/share/man" \
    install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
