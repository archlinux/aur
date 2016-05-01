# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=1339secure-git
pkgver=r21.bc2bbee
pkgrel=1
pkgdesc="Encrypted uploads to any pomf.se clone"
arch=('any')
url="https://github.com/AdrianKoshka/1339secure"
license=('GPL3')
makedepends=('git')
depends=('bash' 'curl' 'gnupg')
source=('git+https://github.com/AdrianKoshka/1339secure.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/1339secure"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/1339secure"
   mkdir -p $pkgdir/usr/bin/
   install -m 0755 pomfsecure $pkgdir/usr/bin/
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
