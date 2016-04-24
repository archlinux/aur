pkgname=krudio-git
pkgver=20160424
_git=e0761d6f2bbee8479e81e6a91c0b9b082e5759f5
_repo=krudio
pkgrel=2
pkgdesc="Simple Qt5 radio player"
arch=('i686' 'x86_64')
url="https://github.com/loast/${_repo}"
license=('MIT')
makedepends=('git' 'qt5-multimedia')
depends=('git' 'libnotify' 'qt5-multimedia' 'hicolor-icon-theme')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
md5sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/status"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/22x22/status"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/24x24/status"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin"
    cd "$srcdir/${_repo}-${_git}"
    make all
    make install prefix="$pkgdir"/usr 
}