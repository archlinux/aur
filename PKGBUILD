# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi.net>

pkgname=silos-git
pkgver=0.1.42.r0.g3c30b19
pkgrel=1
pkgdesc='Web-app container, with multimedia apps, productivity suites, and others.'
url='https://github.com/intersimone999/pyqtws'
license=('GPL3')
arch=('any')
makedepends=('git' 'python-setuptools')
depends=('xdg-utils' 'qt5-webengine' 'python' 'python-pip' 'libnotify' 'python-pyqtwebengine' 'python-qtpy' 'python-gobject')
optdepends=(
  'silo-amazon: Silo app for Amazon (US and IT)'
  'silo-booking: Silo app for Booking.com'
  'silo-gmail: Silo app for Gmail'
  'silo-google-keep: Silo app for Google Keep'
  'silo-google-maps: Silo app for Google Maps'
  'silo-google-photos: Silo app for Google Photos'
  'silo-google-travel: Silo app for Google Travel'
  'silo-gsuite: Silo app for Google Office (Drive, Documents, Sheets)'
  'silo-hey: Silo app for Hey.com' 'silo-netflix: Silo app for Netflix'
  'silo-office365: Silo app for Microsoft Office365'
  'silo-primevideo: Silo app for Amazon Primevideo'
  'silo-raiplay: Silo app for RaiPlay'
  'silo-skype: Silo app for Skype'
  'silo-telegram: Silo app for Telegram Web'
  'silo-todoist: Silo app for Todoist'
  'silo-trello: Silo app for Trello'
  'silo-twitch: Silo app for Twitch'
  'silo-whatsapp: Silo app for WhatsApp'
  'silo-wikipedia: Silo app for Wikipedia'
  'silo-youtube: Silo app for YouTube'
)
source=('git+https://github.com/intersimone999/pyqtws.git')
sha256sums=('SKIP')

pkgver() {
  cd "pyqtws"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pyqtws"

  python setup.py build
}

package() {
  cd "pyqtws"

  python setup.py install \
    --skip-build \
    --root="${pkgdir}" \
    --optimize=1
}
