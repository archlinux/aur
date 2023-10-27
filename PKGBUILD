# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=kwin-effects-burn-my-windows
pkgver=40
pkgrel=1
pkgdesc='Disintegrate your windows with style.'
arch=('any')
url='https://github.com/Schneegans/Burn-My-Windows'
license=('GPL3')
depends=('kwin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee3a51ae4e59e77281574250851340845c5c821ea4da04e8f2ea0ce1e6e08588')
b2sums=('85b038245d4160aa3f052e7b550ed3c7e352e983eab79cb0a6066897925fd33f861fc1dedd4cc0220aa9a8c4423e395acbf611aa468298eb31424680466c3c56')

build() {
  cd "Burn-My-Windows-$pkgver/kwin"

  ./build.sh
}

package() {
  cd "Burn-My-Windows-$pkgver"

  install -dm0755 "$pkgdir/usr/share/kwin"
  cp -r "kwin/_build" "$pkgdir/usr/share/kwin/effects"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
