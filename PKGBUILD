# Maintainer: Kyle Westhaus <pkgbuild dot aur.o at kwest dot haus>

pkgname=ratel-bin
pkgver=21.03
pkgrel=1
pkgdesc='Dgraph data visualizer and cluster manager'
arch=('x86_64')
url='https://github.com/dgraph-io/ratel'
license=('APACHE')
provides=('ratel')
conflicts=('ratel' 'ratel-git')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/dgraph-ratel-linux.tar.gz"
        'dgraph-ui.service')
sha256sums=('44686173e9dbe9267c7bb202b3d8d9cabc9a7c936885bf34a1922d2604b05618'
            'ce1df68d8d167b62ba08ca0b58450e35311e35267664aa7cd66a6e83cec9baae')

package() {
  cd "$srcdir"
  for binary in ratel; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 dgraph-ui.service "$pkgdir/usr/lib/systemd/system/dgraph-ui.service"
}

# vim:set ts=2 sw=2 et:
