# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=skycoin_archlinux_packages-keyring
pkgdesc="Skycoin archlinux packages keyring"
pkgver=1
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/0pcom/skycoin-archlinux-packages"
license=(BSD)
makedepends=()
source=('https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/blob/master/skycoin_archlinux_packages-keyring/skycoin_archlinux_packages-keyring.gpg'
        'https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/blob/master/skycoin_archlinux_packages-keyring/skycoin_archlinux_packages-trusted')
sha256sums=('765bc9d1b7d4c31531289582f5f69df5189a94ccb4146054db3984c6bc0aa27b'
            '6a31475a58258e152b18ea4746185d75d9ae0e04f7c86fcbd7dbe42e3fea0ee0')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

package() {
msg2 'installing files'
mkdir -p $pkgdir/usr/share/pacman/keyrings
install -Dm755 $srcdir/$pkgname.gpg $pkgdir/usr/share/pacman/keyrings/$pkgname
install -Dm755 $srcdir/skycoin_archlinux_packages-trusted $pkgdir/usr/share/pacman/keyrings/$pkgname
}
