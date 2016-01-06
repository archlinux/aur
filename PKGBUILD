# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='outspline'
pkgver='0.8.3'
pkgrel=1
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
source=("http://downloads.sourceforge.net/project/outspline/main/$pkgname-$pkgver.tar.bz2")
sha256sums=('aca05f38d14479c27aced57e08222b573bb5143d6c881caa24650684b60c9e4f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
