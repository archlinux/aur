# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello-bin
_pkg="${pkgname%-bin}"
pkgver=1.5.5
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('x86_64')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('gcc-libs')
provides=('jello')
conflicts=('jello')
changelog=CHANGELOG
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/README.md"
        "jello-$pkgver-man.1::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/man/jello.1")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/jello-$pkgver-linux-x86_64.tar.gz")
sha256sums=('1a404c97debd32c80005736bd368078ccc8f858c8ebafa2576b0c3919afb92c4'
            '6e8a96724f65210e404db5fccdd56c010a011bf9bfe76dc1d32c9e28e46b5e39'
            '8aa6657d1cff24bf93345db817c46e134ebf26cf552c3d303c00efb2602a39df')
sha256sums_x86_64=('a05bbe6f515ac4d0f783b35fa678b3ae1abebdf937042a658249b42d56b2e292')

package() {
  install -Dv "$_pkg" -t "$pkgdir/usr/bin"
  install -Dvm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dvm644 "$_pkg-$pkgver-man.1" "$pkgdir/usr/share/man/man1/$_pkg.1"
}

# vim: ts=2 sw=2 et:
