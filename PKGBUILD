#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>


pkgrel=2
pkgver=1.7
_name="tvb-recorder"
pkgname="$_name"
pkgdesc='TV-recording und live-switch with TV-Browser plugin'
url='https://codeberg.org/tuxnix/tvb-recorder'
arch=('any')
license=('GLPv2-only')
depends=('tvbrowser' 'mpv' 'at' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/tvb-recorder' $_name.install)
sha512sums=('SKIP')
install="$_name.install"

package() {
    cd "$srcdir/$_name"
    install -Dm744 $_name "$pkgdir/usr/local/bin/$_name"
    install -Dm744 tvb-switch "$pkgdir/usr/local/bin/tvb-switch"
    install -Dm744 tvb-cut "$pkgdir/usr/local/bin/tvb-cut"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
