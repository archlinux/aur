# Maintainer: Cody Dostal <dostalcody@gmail.com>

pkgname=netgui
_gitname=NetGUI
pkgver=0.81
pkgrel=1
pkgdesc="GUI for netctl, stable but beta. Replaces WiFiz."
arch=('any')
url="https://github.com/codywd/$_gitname"
license=('MIT')
depends=('python' 'python-gobject' 'netctl' 'gtksourceview3' 'libnotify')
optdepends=(
'notification-daemon: Desktop Notifications'
'notify-osd: Desktop Notifications (others dont work for me personally)'
)
makedepends=('git')
provides=('netgui')
conflicts=('netcfg' 'wicd')
replaces=('wifiz' 'wifiz-git')
options=(!emptydirs)
source=("git+https://github.com/codywd/$_gitname.git")
md5sums=('SKIP')
sha256sums=('SKIP')

package() {
    cd $srcdir/$_gitname
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
