#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgver="1.8"
pkgrel="0"
_name="tvb-recorder"
pkgname="$_name"
pkgdesc='TV-Browser plugins for switching and recording'
url='https://codeberg.org/tuxnix/tvb-recorder'
arch=('any')
license=('GLPv2-only')
depends=('at' 'ffmpeg' 'mpv' 'tvbrowser')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/tvb-recorder' $_name.install)
sha512sums=('SKIP'
            '57ea9155cdd7e5a65d2d861d498136cccf8ed897828569c5d16b61709e2de84945bfde26aee034eff3fa5b24a9a04db502aade680192e5f253ffe7c73ff0ce41')
install="$_name.install"

package() {
    cd "$srcdir/$_name"
    install -Dm605 $_name "$pkgdir/usr/local/bin/$_name"
    install -Dm605 tvb-switch "$pkgdir/usr/local/bin/tvb-switch"
    install -Dm605 tvb-cut "$pkgdir/usr/local/bin/tvb-cut"
    install -Dm605 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
