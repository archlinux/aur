# Maintainer: Papajoker <papajoke [at] archlinux [dot] info>
pkgname=pachook
pkgver=0.1.1.r7.a833abff
pkgrel=1
pkgdesc="simple administrator pacman hooks"
arch=('any')
url="https://github.com/papajoker/pachook"
license=('GPL')
depends=('pacman')
makedepends=('git')
source=("$pkgname::git+http://github.com/papajoker/pachook#branch=master")
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

