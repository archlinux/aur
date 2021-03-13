# Maintainer: lmartinez-mirror
# Contributor: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-humantime-git
pkgver=1.0.0.r6.g53b2adb
pkgrel=1
pkgdesc='Fish plugin for making timestamps human-readable'
arch=('any')
url="https://github.com/jorgebucaran/humantime.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
# checkdepends=('fish-fishtape')
provides=('fish-humantime')
conflicts=('fish-humantime')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

# check() {
#   ## Does not work yet
#   cd "$pkgname/tests"
#   fish -Pc 'fishtape humantime.fish'
# }

package() {
  cd "$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
  install -Dm644 -t "$pkgdir/etc/fish/functions" functions/humantime.fish
}
