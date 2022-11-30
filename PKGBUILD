pkgname=mkinitcpio-fakeuptime
pkgver=1
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook for faking your system uptime"
arch=('any')
license=('custom')
depends=('mkinitcpio' 'bash' 'util-linux')
source=("fakeuptime_hook" "fakeuptime_install" "init_fakeuptime.sh")
b2sums=('8dc4803d0e8fbcbd28bbff83cb681433947b15d1ab4ff30ac82efa8fb5cfcc76ecd24cf42a2a124f1df45c22cdd0be67edd0a91ea400a692c60c328f660f23f6'
        '498cb35d9f582f5dce2911b06e3127fb2f5fbcb0bf94fc5ccff2e506185d8d10e8d79c32784b18e61549706e571a25f3c3e230c531b10814733c2d2cf5510bff'
        'de0f6c5383e529217f243c95af4c478b2efb344231e7f7307396d36f796b00764547100ff2143f262add4926d8088260971878595f2375f0b0b3c78ce7411e04')
install=mkinitcpio-fakeuptime.install

package() {
  install -Dm644 "$srcdir/fakeuptime_hook"        "$pkgdir/usr/lib/initcpio/hooks/fakeuptime"
  install -Dm644 "$srcdir/fakeuptime_install"     "$pkgdir/usr/lib/initcpio/install/fakeuptime"
  install -Dm755 "$srcdir/init_fakeuptime.sh"     "$pkgdir/usr/bin/init_fakeuptime.sh"
}
