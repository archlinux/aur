# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=pacmatic
pkgver=20150126
pkgrel=6
pkgdesc="A pacman wrapper to avoid bricking your system and such other surprises."
arch=('any')
url="http://kmkeen.com/pacmatic/"
license=('GPL')
depends=('pacman' 'bash' 'expac' 'pacman-contrib')
optdepends=('vim: for vimdiff'
            'python-html2text: for prettier news'
            'fakeroot: for cron-pacmatic script')
source=("http://kmkeen.com/$pkgname/$pkgname-$pkgver.tar.gz"
        "_pacmatic")
md5sums=('5998de70777bc5df373fbf230787a4c7'
         '1c369c8fe595cbb41d04e214efd39a1e')
sha256sums=('4f06bd31b575ba0c0df5e579e4c707778eeb387cc57d44f50ac6ffed7eadf445'
            'b2ea7ea7b0a45cd21c7631f6320cdafaac7bb4d8d3d32f2a6a9415bddedd0b40')

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 pacmatic      "$pkgdir/usr/bin/pacmatic"
  install -Dm0755 cron-pacmatic "$pkgdir/usr/bin/cron-pacmatic"
  install -Dm0644 pacmatic.1    "$pkgdir/usr/share/man/man1/pacmatic.1"
  install -Dm0644 ../_pacmatic  "$pkgdir/usr/share/zsh/site-functions/_pacmatic"
}

# vim: ts=2 sw=2 et:
