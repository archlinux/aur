pkgname=cerebro-elasticsearch
pkgver=0.9.4
pkgrel=1
pkgdesc="cerebro is an open source elasticsearch web admin tool built using Scala, Play Framework, AngularJS and Bootstrap."
arch=('i686' 'x86_64')
url="https://github.com/lmenezes/cerebro"
license=('MIT')
depends=("java-runtime-headless>=8")
source=(https://github.com/lmenezes/cerebro/releases/download/v$pkgver/cerebro-$pkgver.tgz
       cerebro.service)
sha256sums=('c17f4abaaa7eb7d32c71ba17effc9995f3a96ee7cf10f4bfc929537df6430710'
            'c5064fcfc495a08d538e4b2fc041389ab711f7e68f65bac5f5481f211cdc6fb8')
noextract=()

package() {
  cd "$srcdir/cerebro-$pkgver"
  install -d -m0755 "$pkgdir/opt/cerebro"
  cp -dpr --no-preserve=ownership ./ "$pkgdir/opt/cerebro"
  install -D -m644 "$srcdir/cerebro.service" "$pkgdir/usr/lib/systemd/system/cerebro.service"
}

# vim:set ts=2 sw=2 et:
