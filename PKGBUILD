# Maintainer: lmartinez-mirror
pkgname=fish-pisces-git
pkgver=0.7.0
pkgrel=1
pkgdesc="Fish plugin for matching paired symbols"
arch=('any')
url="https://github.com/laughedelic/pisces"
license=('LGPL3')
groups=('fish-plugins')
depends=('fish>=2.3')
provides=('fish-pisces')
conflicts=('fish-pisces')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

package() {
  cd "pisces-$pkgver"
  install -Dm644 conf.d/pisces.fish -t "$pkgdir/etc/fish/conf.d/"
  find functions -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fish/{}" \;
}

