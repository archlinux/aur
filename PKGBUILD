pkgname=3delta-git
pkgver=1
pkgrel=1
pkgdesc="Host software especially suited for delta 3d printers"
arch=('i686' 'x86_64')
url="https://github.com/minad/3delta"
license=('GPL')
depends=('tk' 'tcllib' 'tcl' 'tklib')
makedepends=('git')
conflicts=('3delta')
provides=('3delta')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/minad/3delta.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "3delta" "$pkgdir/usr/bin/3delta"
}
