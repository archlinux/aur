# Maintainer: Alexey Korop <akorop@ukr.net>
# Contributor: Martin Wimpress <code@flexion.org>
# Fixed by: ABOhiccups <info@abohiccups.com>

_pkgname=conky-manager2
pkgname=${_pkgname}-git
pkgver=2.7
pkgrel=3
pkgdesc="Fork of GUI for managing Conky widgets. Support added for latest conky config version - git"
arch=('x86_64')
license=('GPL3')
url="https://github.com/zcot/conky-manager2"
depends=('cairo' 'conky' 'desktop-file-utils' 'gtk3' 'imagemagick' 'json-glib' 'libgee' 'p7zip' 'rsync')
makedepends=('vala')
provides=('conky-manager2')

package() {
    git clone https://github.com/zcot/$_pkgname.git
    cd $_pkgname
    make
    make DESTDIR="${pkgdir}" install
}
