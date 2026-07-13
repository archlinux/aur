# Maintainer: phluxjr <phluxjr@phluxjr.net>
pkgname=confy-tui
pkgver=3.0.0
pkgrel=1
pkgdesc="a config manager for linux/unix based systems, now with basic windows support!"
arch=('any')
url="https://github.com/phluxjr/confy"
license=('GPL-3.0-or-later')
depends=('python')
optdepends=('sshfs: required for :device remote profiles'
            'polkit: required for :su elevated editing')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phluxjr/confy/archive/v${pkgver}.tar.gz")
sha256sums=('9eb87a6af773a822b4cb52d9c7a6dbbdfb8bbdb3a1108d05e602d7b67a3e06ba')

package() {
    cd "$srcdir/confy-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/confy"
    install -Dm644 confy.1 "$pkgdir/usr/share/man/man1/confy.1"
}
