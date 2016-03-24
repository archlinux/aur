# Maintainer: Papajoker <papajoke [at] archlinux [dot] info>
pkgname=pachook
pkgver=0.1.2.r0.ga833abf
pkgrel=1
pkgdesc="simple administrator pacman hooks"
arch=('any')
url="https://github.com/papajoker/pachook"
license=('GPL')
depends=('pacman')
makedepends=('git')
source=("$pkgname::git+https://github.com/papajoker/pachook")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  cp -r usr ${pkgdir}/
  cp -r etc ${pkgdir}/
}

