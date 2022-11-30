pkgname=mkinitcpio-fakeuptime
pkgver=1
pkgrel=3
pkgdesc="Archlinux mkinitcpio hook for faking your system uptime"
arch=('any')
license=('custom')
depends=('mkinitcpio' 'bash' 'util-linux')
source=("fakeuptime_hook" "fakeuptime_install" "init_fakeuptime.sh")
b2sums=('2f00d085d6d5d7e33910b0e6b2efe9d657b298c014457d33f6284cd0e6b5f9c55e86080c670400e0622d9c895a824d7afb4a16dc24c6a91b074efc9b1a494d60'
        '498cb35d9f582f5dce2911b06e3127fb2f5fbcb0bf94fc5ccff2e506185d8d10e8d79c32784b18e61549706e571a25f3c3e230c531b10814733c2d2cf5510bff'
        '3846325f37656aa4cd49d60bd4319ab87479562537ea39286c7a323cd265bb79e9fcb015e4f1037238cc490a28289ddef5b1733e6b1f70adf96665f91a2e0ad2')
install=mkinitcpio-fakeuptime.install

package() {
  install -Dm644 "$srcdir/fakeuptime_hook"        "$pkgdir/usr/lib/initcpio/hooks/fakeuptime"
  install -Dm644 "$srcdir/fakeuptime_install"     "$pkgdir/usr/lib/initcpio/install/fakeuptime"
  install -Dm755 "$srcdir/init_fakeuptime.sh"     "$pkgdir/usr/bin/init_fakeuptime.sh"
}
