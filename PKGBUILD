# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=alacryd-git
pkgver=20160110
pkgrel=1
pkgdesc="Expedient Perl6 module installation"
arch=('any')
depends=('perl6')
groups=('perl6')
url="https://github.com/atweiden/alacryd"
license=('UNLICENSE')
source=(git+https://github.com/atweiden/alacryd)
sha256sums=('SKIP')
provides=('alacryd')
conflicts=('alacryd')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/alacryd"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/alacryd"

  msg2 'Installing...'
  install -Dm 755 alacryd -t "$pkgdir/usr/bin"
}
