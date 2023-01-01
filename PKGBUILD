# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx
epoch=2
_pkgver=1.0-beta2
pkgver=1.0beta2
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
source=(${url}/archive/refs/tags/${_pkgver}.tar.gz)
sha256sums=('418101acb09a4fd4fd94280fa5a313a4fab103fd105ca267ea72fc609f5bb865')
install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1

  install -Dm644 "${srcdir}/${pkgname}-${_pkgver}"/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png
}
