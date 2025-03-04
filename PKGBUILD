# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Anthony Ruhier <anthony.ruhier@gmail.com>
pkgname=headphones
pkgver=0.6.3
pkgrel=2
pkgdesc="An automated music downloader for NZB and Torrent, written in Python. It supports SABnzbd, NZBget, Transmission, µTorrent, Deluge and Blackhole."
arch=('any')
url="https://github.com/rembo10/headphones"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
  'python>=3.11'
  'python-urllib3'
  'python-pytz'
  'python-requests-toolbelt'
  'python-markupsafe'
  'python-mako'
  'python-html5lib'
  'python-pylast'
  'python-jaraco.classes'
  'python-six'
  'python-musicbrainzngs'
  'python-cryptography'
  'python-jaraco.context'
  'python-lxml'
  'python-certifi'
  'python-colorama'
  'python-jaraco.text'
  'python-yaml'
  'python-gobject'
  'python-jaraco.functools'
  'python-beautifulsoup4'
  #'gobject-introspection-runtime'
  'python-setuptools'
  'python-pillow'
  'python-mutagen'
  'python-zipp'
  'python-more-itertools'
  'python-soupsieve'
  'python-chardet'
  'python-pygments'
  'python-idna'
  'gstreamer'
  'python-simplejson'
  'python-requests'
  'python-pyqt5-webkit'
  'python-pyxdg'
  'python-importlib-metadata'
  'python-tzlocal'
  'python-typing_extensions'
  'python-brotli'
  'python-flask'
  'python-blinker'
  'python-pyqt5'
  'python-sqlalchemy'
  'python-pyasn1'
  'pyside6'
  'python-pyopenssl'
  'python-werkzeug'
  'python-tornado'
)
optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'jackett: torrent indexer proxy'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('98e5c7bc2c09c689d03d92e6faff697e9cdfb48850a816d8ebdf464e60017cec'
            'cb362da63786c752d928770d22c8f8ad0a85ca1b6bafe83982bdcb9b4455bbf9'
            '348abc0627d63762a97655b5893c306e5b923857be5d0b876e9df5fea7ef9ed9'
            'ff2a4be9594518b670dafe80023772affc5e8cca85bb4c95972c7c14c72453c2')
package() {
  install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/lib/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
