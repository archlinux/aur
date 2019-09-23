# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=buildnotify
pkgver=2.0.0
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
sha256sums=('5057a395d1a6252d66f079a81494fb9cc2917f6b716199f3f6c6085b5766129e')

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
