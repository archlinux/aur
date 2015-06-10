# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=lc-git
pkgver=abd5c25
pkgrel=1
pkgdesc='Commandline utility for listing directory contents in columns'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/lc'
license=('MIT')
depends=('python')
install='lc.install'
source=('lc::git://github.com/xyproto/lc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/${pkgname%-git}"

  # /usr/bin/lc conflicts with mono :(
  install -Dm755 lc "$pkgdir/usr/bin/lsc"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
