# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx
epoch=2
_pkgver=1.0-beta3
pkgver=1.0beta3
pkgrel=1
pkgdesc="TaskBar with groupping and group manipulation"
arch=('i688' 'x86_64' 'armv7h' 'aarch64')
#url="https://github.com/M7S/dockbarx"
url="https://github.com/xuzhen/dockbarx"
license=('GPL3')
depends=('libkeybinder3' 'python-cairo' 'dbus-python' 'python-gobject' 'python-pillow'
         'python-xlib' 'python-xdg')
makedepends=('python-setuptools' 'python-polib')
optdepends=('mate-panel: mate applet'
            'zeitgeist: recently used file list'
            'xfce4-dockbarx-plugin>=0.6: xfce4-panel plugin'
            'python-pyudev: dockx battery applet'
            'gconf: export settings from older versions of dockbarx'
            'python-lxml: import settings script')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('61be03c1e73bd435d7330917d1a014082a90b3f07bbb6bc4b9d6e3b52a859138')
install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1

  install -Dm644 "${srcdir}/${pkgname}-${_pkgver}"/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png
}
