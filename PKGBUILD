# Maintainer: Sandy Marko Knauer <smk@knasan.de>

pkgname=sysnapshot
pkgver=0.0.3
_pkgver=0.0.3
pkgrel=1
pkgdesc='backup tool written in ruby'
arch=('any')
license=('GPL2')
url='http://github.com/knasan/sysnapshot'
makedepends=('git')
provides=('sysnapshot')
source=("https://github.com/knasan/sysnapshot/archive/0.0.3.tar.gz")
depends=('ruby' 'rsync')
sha256sums=('759301545378e0ca14bb12fa491c5745336fbe14f394b73a920e265aa38e9614')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/sysnapshot"
  mkdir -p "$pkgdir/etc/sysnapshot/"

  install -m755 bin/sysnapshot "$pkgdir/usr/bin/"
  install -m644 lib/sysnapshot/*.rb "$pkgdir/usr/lib/sysnapshot"
  install -m644 etc/sysnapshot/sysnapshot.* "$pkgdir/etc/sysnapshot/"
}

