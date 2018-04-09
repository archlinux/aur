# Maintainer: <xris_pop@yahoo.ca>
_pkgname=share-moe-paste
pkgname=$_pkgname-git
pkgver=0.8.2.r0.843b6aa7
pkgrel=1
pkgdesc="This is a command-line tool that makes a paste from a file, clipboard or standard input and uploads it to shr.moe"
arch=('any')
url="https://gitgud.io/rarity/share-moe-paste"
license=('custom:The Unlicense')
depends=('curl' 'xsel')
options=('!strip')
source=("git+https://gitgud.io/rarity/share-moe-paste.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 smp "$pkgdir"/usr/bin/smp
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
