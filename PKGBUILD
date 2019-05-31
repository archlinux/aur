# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=put
_pkgver="2.0.5-a.3"
pkgver="$(tr '-' '.' <<< $_pkgver)"
pkgrel=1
pkgdesc='A modern, featureful echo(1)'
url='https://github.com/Unlimiter/put'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$url/archive/v$_pkgver.tar.gz")
sha256sums=('474a9074ac380c3ff37f4637f66fc5be2e868492f313b2ef486c767d1c16d624')

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
