# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=buildnotify
pkgver=2.1.0
pkgrel=1
pkgdesc="A system tray based build status notification app for cctray.xml feeds"
arch=('any')
url="https://github.com/anaynayak/buildnotify"
license=('GPL3')
depends=('python' 'python-pytz' 'python-pyqt5' 'python-dateutil' 'python-requests')
optdepends=('python-keyring: keyring support')
makedepends=('python-setuptools')
conflicts=('buildnotify-hg')
replaces=('buildnotify-hg')
source=("https://github.com/anaynayak/buildnotify/archive/${pkgver}.zip")
sha256sums=('682831bfe7c0f88103fe6033b7fcca7124744bd0156de7bb10bbcc15dcb2149f')

_installmodule() {
  pushd "${srcdir}/buildnotify-${pkgver}"
  /usr/bin/python3 setup.py install --root="${pkgdir}/" --optimize=1
  popd
}

package() {
  _installmodule

  cd "${srcdir}/buildnotify-${pkgver}"

  install -D -m 644 buildnotify.desktop "${pkgdir}/usr/share/applications/buildnotify.desktop"
  install -D -m 644 buildnotify.svg "${pkgdir}/usr/share/pixmaps/buildnotify.svg"
}

# vim:set ts=2 sw=2 et:
