# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com> 

pkgname=thinkpad-helix-utils
pkgver=v2.7.r13.gb950c1a
pkgrel=1
pkgdesc="Useful tools for the Lenovo ThinkPad Helix"
arch=('i686' 'x86_64')
url="https://github.com/ultravioletnanokitty/thinkpad-helix-utils"
license=('WTFPL')
depends=('xorg-xinput' 'xorg-xrandr')
makedepends=('git')
source=("$pkgname"::'git://github.com/ultravioletnanokitty/thinkpad-helix-utils.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 ./helix-rotate "$pkgdir/usr/bin/helix-rotate"
  install -Dm0644 ./helix-rotate.desktop "$pkgdir/usr/share/applications/helix-rotate.desktop"
  install -Dm0755 ./helix-toggle-touch "$pkgdir/usr/bin/helix-toggle-touch"
  install -Dm0644 ./helix-toggle-touch.desktop "$pkgdir/usr/share/applications/helix-toggle-touch.desktop"
}
