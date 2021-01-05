# Maintainer: Simone Scalabrino <s.scalabrino9@gmail.com>
pkgname=silos
_gitname=pyqtws
_gittag=0.1.54
pkgver=$_gittag
pkgrel=1
pkgdesc='Web-app container, with multimedia apps (YouTube, Netflix, Twitch, VVVVID, and RaiPlay),  productivity suites (Microsoft Office 365, Skype, Google Office, Trello, and Gmail), and others (WhatsApp web and Wikipedia)'
arch=('any')
url='https://github.com/intersimone999/pyqtws'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine' 'python' 'python-pip' 'libnotify' 'python-pyqtwebengine' 'python-qtpy' 'python-gobject')
optdepends=('silo-amazon: Silo app for Amazon (US and IT)' 'silo-booking: Silo app for Booking.com' 'silo-gmail: Silo app for Gmail' 'silo-google-keep: Silo app for Google Keep' 'silo-google-maps: Silo app for Google Maps' 'silo-google-photos: Silo app for Google Photos' 'silo-google-travel: Silo app for Google Travel' 'silo-gsuite: Silo app for Google Office (Drive, Documents, Sheets)' 'silo-hey: Silo app for Hey.com' 'silo-netflix: Silo app for Netflix' 'silo-office365: Silo app for Microsoft Office365' 'silo-primevideo: Silo app for Amazon Primevideo' 'silo-raiplay: Silo app for RaiPlay' 'silo-skype: Silo app for Skype' 'silo-telegram: Silo app for Telegram' 'silo-todoist: Silo app for Todoist' 'silo-trello: Silo app for Trello' 'silo-twitch: Silo app for Twitch' 'silo-whatsapp: Silo app for WhatsApp' 'silo-wikipedia: Silo app for Wikipedia' 'silo-youtube: Silo app for YouTube')
makedepends=('git' 'python-setuptools')
source=("git+$url.git#tag=$_gittag")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_gitname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_gitname}"
    install -Dm755 "desktop/silos.desktop" "${pkgdir}/usr/share/applications/silos.desktop"
    install -Dm755 "desktop/silos-options.desktop" "${pkgdir}/usr/share/applications/silos-options.desktop"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
