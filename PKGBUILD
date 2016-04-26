# Maintainer: dmerej <d.merej@gmail.com>

pkgname=hollywood
pkgver=1.7
pkgrel=2

pkgdesc="Fill your console with Hollywood melodrama technobabble."

arch=('any')

url="https://launchpad.net/hollywood"
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
  "${pkgname}-${pkgver}.tar.gz::${url}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.orig.tar.gz"
  "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-0ubuntu1.debian.tar.xz"
  "license.txt::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt"
)

md5sums=(
  'a8fea084ecf1027abef75858033a6e81'
  '743f21cddd30929ab744480e53123c41'
  '65d3616852dbf7b1a6d4b53b00626032'
)

package() {
  # Install files
  install -dm0755 "$pkgdir/"{usr/bin,usr/lib/hollywood,usr/share/{licenses/hollywood,man/man1,hollywood}}
  install -m 0755 "$srcdir/$pkgname-$pkgver/bin/"*  "$pkgdir/usr/bin"
  install -m 0755 "$srcdir/$pkgname-$pkgver/lib/hollywood/"* "$pkgdir/usr/lib/hollywood"
  install -m 0644 "$srcdir/$pkgname-$pkgver/share/hollywood/"*  "$pkgdir/usr/share/hollywood"
  install -m 0644 "$srcdir/$pkgname-$pkgver/"{README,ChangeLog}  "$pkgdir/usr/share/hollywood"
  install -m 0644 "$srcdir/$pkgname-$pkgver/share/man/man1/"*  "$pkgdir/usr/share/man/man1"
  # copyright and license
  install -m 0644 "$srcdir/debian/copyright" "$pkgdir/usr/share/licenses/hollywood/copyright"
  install -m 0644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/hollywood/license.txt"
}
