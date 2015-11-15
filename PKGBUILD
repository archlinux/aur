# Maintainer: goodmind <andwebar@gmail.com>
pkgname=infornography-git
pkgver=0.3.r0.g9e9c603
pkgrel=1
pkgdesc="Racket script to show system information, lightweight alternative to screenfetch."
arch=('any')
url="https://github.com/telegram-wired/infornography"
license=('MIT')
depends=('racket')
makedepends=('git')
source=("$pkgname::git+https://github.com/telegram-wired/infornography.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd $pkgname
  install -D -m755 "infornography.rkt" "$pkgdir"/usr/bin/infornography
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
