# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Contributor: linuxer <linuxer@artixlinux.org>

pkgname=ananicy-runit
_alias=ananicy
pkgver=2.2.0.r55.g5559e01
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy"
license=('BSD')
depends=('ananicy' 'runit' 'bash' 'schedtool')
makedepends=('git' 'make')
source=("ananicy.finish"
        "ananicy.run"
        "ananicy.start")
b2sums=('SKIP'
        'SKIP'
        'SKIP')
install=$pkgname.install

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "$pkgdir/etc/runit/sv/$_alias"
  cp "ananicy.finish" $pkgdir/etc/runit/sv/$_alias/finish
  cp "ananicy.run" $pkgdir/etc/runit/sv/$_alias/run
  cp "ananicy.start" $pkgdir/etc/runit/sv/$_alias/start
  install=ananicy-runit.install
}
