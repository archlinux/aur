# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=$_pkgname
pkgver=0.9.27
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
license=('GPL-3.0-or-later')
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jclehner/nmrpflash/archive/v$pkgver.tar.gz")
sha256sums=('a9de4296ec3db91e044f6ce5412342616920c6afda1df312bbeefc9013251f00')
b2sums=('13b4b57e3401d566fd9555ec056390a89946dbbc1114648addaf99bf4001bdb49451ec2691e151f8269c16e263c3136fdf85d67608a848f0966aaa15c6e12c0a')

build() {
  cd "$_pkgname-$pkgver"

  make
}

package() {
  cd "$_pkgname-$pkgver"

  install -dm0755 "$pkgdir"/usr/bin
  make install PREFIX="$pkgdir/usr"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
