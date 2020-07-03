# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
pkgname=gittools-git
pkgver=r61.71ea557
pkgrel=1
pkgdesc="A package with 3 tools for pwn'ing websites with .git repositories available"
arch=('any')
url="https://github.com/internetwache/GitTools"
license=('MIT')
depends=('git' 'python' 'python-requests' 'curl')
provides=('gittools')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 Dumper/README.md "$pkgdir/usr/share/doc/$pkgname/Dumper/README.md"
  install -Dm644 Extractor/README.md "$pkgdir/usr/share/doc/$pkgname/Extractor/README.md"
  install -Dm644 Finder/README.md "$pkgdir/usr/share/doc/$pkgname/Finder/README.md"
  install -Dm755 Dumper/gitdumper.sh "$pkgdir/usr/bin/gitdumper"
  install -Dm755 Extractor/extractor.sh "$pkgdir/usr/bin/gitextractor"
  install -Dm755 Finder/gitfinder.py "$pkgdir/usr/bin/gitfinder"
}

# vim:set ts=2 sw=2 et:
