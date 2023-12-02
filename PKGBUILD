# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

pkgname=shortix-desktop
_name=shortix
pkgver=0.6.1
pkgrel=1
pkgdesc='Script that creates human-readable symlinks for Steam Proton game prefixes, adapted for traditional desktops.'
arch=('any')
url='https://github.com/Jannomag/shortix'
license=('GPL3')
depends=('sed')
optdepends=('steam: create and run proton prefixes')
install=$pkgname.install
source=("https://github.com/SeongGino/shortix/archive/refs/tags/v$pkgver.zip")
sha256sums=('0c0ac91a066ac20afa19863b57a42c7528b19e078bfb850b2b73ff320eb7d8cf')

package() {
    cd "$_name-$pkgver"
    install -Dp shortix.sh "$pkgdir/usr/bin/shortix"
    install -Dp remove_prefix.sh "$pkgdir/usr/bin/shortix-delete"
    install -Dp shortix.service "$pkgdir/usr/lib/systemd/user/shortix.service"
}
