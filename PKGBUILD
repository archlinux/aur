# Contributor: Barry <brrtsm at gmail . com>
# Contributor: dmerej <d.merej@gmail.com>

pkgname=hollywood
pkgver=1.21
pkgrel=3

pkgdesc="Fill your console with Hollywood melodrama technobabble."

arch=('any')

url="https://github.com/dustinkirkland/hollywood"
license=('Apache' 'Custom:CC0-1.0')

depends=(
  'apg'
  'bmon'
  'byobu'
  'ccze'
  'cmatrix'
  'coreutils'
  'gawk'
  'htop'
  'jp2a'
  'mlocate'
  'man-db'
  'moreutils'
  'mplayer'
  'openssh'
  'tree'
  'speedometer'
  'util-linux'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://launchpad.net/hollywood/trunk/${pkgver}/+download/${pkgname}_${pkgver}.orig.tar.gz"
  "license.txt"
)

md5sums=(
  'c337ce86c017a8ba0231c24f7ce1eb7d'
  '65d3616852dbf7b1a6d4b53b00626032'
)

package() {
  # Install files
  install -dm0755 "$pkgdir/"{usr/bin,usr/lib/hollywood,usr/share/{licenses/hollywood,man/man1,hollywood}}
  install -m 0755 "$srcdir/$pkgname-$pkgver/bin/hollywood"  "$pkgdir/usr/bin"
  install -m 0755 "$srcdir/$pkgname-$pkgver/lib/hollywood/"* "$pkgdir/usr/lib/hollywood"
  install -m 0644 "$srcdir/$pkgname-$pkgver/share/hollywood/"*  "$pkgdir/usr/share/hollywood"
  install -m 0644 "$srcdir/$pkgname-$pkgver/"{README,ChangeLog}  "$pkgdir/usr/share/hollywood"
  install -m 0644 "$srcdir/$pkgname-$pkgver/share/man/man1/"*  "$pkgdir/usr/share/man/man1"
  # license
  install -m 0644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/hollywood/license.txt"
}
