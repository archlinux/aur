# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='outspline'
pkgver='0.8.4'
pkgrel=2
pkgdesc="Outliner and personal time organizer to manage todo lists, schedule tasks, remind events."
arch=('any')
url="https://kynikos.github.io/outspline/"
license=('GPL3')
depends=('wxpython<3.1')
optdepends=('python2-dbus: prevent opening multiple instances with the same configuration file'
            'dbus-glib: prevent opening multiple instances with the same configuration file'
            'libnotify: for desktop notifications (notify plugin; also requires a notification server)'
            'python2-gobject: for desktop notifications (notify plugin; also requires a notification server)'
            'outspline-extra: extra addons'
            'outspline-experimental: experimental addons'
            'outspline-development: development tools for beta testers')
conflicts=('organism' 'organism-organizer')
replaces=('organism' 'organism-organizer')
install=outspline.install
source=("https://downloads.sourceforge.net/project/outspline/main/$pkgname-$pkgver.tar.bz2")
sha256sums=('d20848fc6bafdd0e385a1284ac1d16b05567acee71db7d5f5c167c40e74227dc')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
