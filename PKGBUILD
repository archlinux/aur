pkgname=mkinitcpio-fakeuptime
pkgver=1
pkgrel=4
pkgdesc="Archlinux mkinitcpio hook for faking your system uptime"
arch=('any')
license=('custom')
depends=('mkinitcpio' 'bash' 'util-linux' 'coreutils')
source=("fakeuptime_hook" "fakeuptime_install" "init_fakeuptime.sh")
b2sums=('2f00d085d6d5d7e33910b0e6b2efe9d657b298c014457d33f6284cd0e6b5f9c55e86080c670400e0622d9c895a824d7afb4a16dc24c6a91b074efc9b1a494d60'
        '498cb35d9f582f5dce2911b06e3127fb2f5fbcb0bf94fc5ccff2e506185d8d10e8d79c32784b18e61549706e571a25f3c3e230c531b10814733c2d2cf5510bff'
        '3e33824de4e4921bf909c4be515d33f2b81263d89d7586d23db42da2c7985fcd12dc5ad8e34e01bd24060baafb0cb1c6ad62e3e271f00a40c7138ce48f2c28c0')
install=mkinitcpio-fakeuptime.install

package() {
  install -Dm644 "$srcdir/fakeuptime_hook"        "$pkgdir/usr/lib/initcpio/hooks/fakeuptime"
  install -Dm644 "$srcdir/fakeuptime_install"     "$pkgdir/usr/lib/initcpio/install/fakeuptime"
  install -Dm755 "$srcdir/init_fakeuptime.sh"     "$pkgdir/usr/bin/init_fakeuptime.sh"
}
