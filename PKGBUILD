# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=buildnotify
pkgver=1.0.4
pkgrel=1
pkgdesc="A system tray based build status notification app for cctray.xml feeds"
arch=('any')
url="https://github.com/anaynayak/buildnotify"
license=('GPL3')
depends=('python2' 'python2-pyqt5' 'python2-pytz' 'python2-dateutil')
optdepends=('python2-keyring: keyring support')
makedepends=('python2-setuptools')
conflicts=('buildnotify-hg')
replaces=('buildnotify-hg')
source=("https://github.com/anaynayak/buildnotify/archive/${pkgver}.zip")
sha256sums=('e127928040d0ba0e7d23ce87a127be3b96d92ef67f52297b8a927c98bfcae578')

_installmodule() {
  pushd "${srcdir}/buildnotify-${pkgver}"
  /usr/bin/python2 setup.py install --root="${pkgdir}/" --optimize=1
  popd
}

package() {
  _installmodule

  cd "${srcdir}/buildnotify-${pkgver}"

  install -D -m 644 buildnotify.desktop "${pkgdir}/usr/share/applications/buildnotify.desktop"
  install -D -m 644 buildnotify.svg "${pkgdir}/usr/share/pixmaps/buildnotify.svg"
}

# vim:set ts=2 sw=2 et:
