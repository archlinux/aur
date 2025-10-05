#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>



pkgver=1.7
pkgrel=5
_name="tvb-recorder"
pkgname="$_name"
pkgdesc='TV-recording und live-switch with TV-Browser plugin'
url='https://codeberg.org/tuxnix/tvb-recorder'
arch=('any')
license=('GLPv2-only')
depends=('tvbrowser' 'mpv' 'at' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/tvb-recorder' $_name.install)
sha512sums=('SKIP'
            '8a37c1e1c09c964147f5039d1c67955b5df8baff29450aa0aa940d58e244c45924cbfe7d2fc582dc8899931a840e8a6a21fcbf377e3fe5de59300e4a1547d345')
install="$_name.install"

package() {
    cd "$srcdir/$_name"
    install -Dm744 $_name "$pkgdir/usr/local/bin/$_name"
    install -Dm744 tvb-switch "$pkgdir/usr/local/bin/tvb-switch"
    install -Dm744 tvb-cut "$pkgdir/usr/local/bin/tvb-cut"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
