# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=ltunify
pkgver=0.3
pkgrel=1
pkgdesc='Tool for working with Logitech Unifying receivers and devices'
arch=('i686' 'x86_64')
url='https://lekensteyn.nl/logitech-unifying.html'
license=('unknown')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Lekensteyn/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('28544d387d000a728282f8647feb90d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make ltunify
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ltunify "$pkgdir/usr/bin/ltunify"
  install -Dm644 udev/42-logitech-unify-permissions.rules "$pkgdir/usr/lib/udev/rules.d/42-ltunify-permissions.rules"
}

