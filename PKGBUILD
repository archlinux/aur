# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=teleirc-bin
_pkgname=${pkgname%-bin}
pkgver=2.2.0
pkgrel=1
url="https://github.com/RITlug/teleirc"
pkgdesc='Go implementation of a Telegram <=> IRC bridge for use with any IRC channel and Telegram group.'
arch=(x86_64)
license=("GPL3")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64")
sha256sums=('54a454324caffd7bc629a0d86bf8e10514c46e6960f6ad820023f910e6b2998a')
sha512sums=('d23b1bd3de38b85cdeb50923128de36248c26e2e2a26c74537910c6e20893384405a6e98842aa5d17f2f0b851597b608d4fcf345cbb03143c6f1acb4d6131c4d')
b2sums=('a34f751dc34d19912efc7a9ddccd11ec2128a5e1dfbdd0e02585c9043f789a6e1f5dbf81318219c05b5c714d4193eef458b4f4ae864e4e86947e2c9676dbb887')

prepare() {
  cd "$srcdir"

  mv ${_pkgname}-${pkgver}-linux-x86_64 "$_pkgname"
}

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
