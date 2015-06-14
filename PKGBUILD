# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='outspline'
pkgver='0.8.2'
pkgrel=1
pkgdesc="Outliner and personal time organizer to manage todo lists, schedule tasks, remind events."
arch=('any')
url="https://kynikos.github.io/outspline/"
license=('GPL3')
depends=('wxpython<3.1')
optdepends=('python2-dbus: prevent opening multiple instances with the same configuration file'
            'dbus-glib: prevent opening multiple instances with the same configuration file'
            'libnotify: for desktop notifications (notify plugin)'
            'python2-gobject: for desktop notifications (notify plugin)'
            'outspline-extra: extra addons'
            'outspline-experimental: experimental addons'
            'outspline-development: development tools for beta testers')
conflicts=('organism' 'organism-organizer')
replaces=('organism' 'organism-organizer')
install=outspline.install
source=("http://downloads.sourceforge.net/project/outspline/main/$pkgname-$pkgver.tar.bz2")
sha256sums=('525613e0f8a36831c9af03714d4124ebcc1462f574fa498d5e28b533d4bfe71b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
