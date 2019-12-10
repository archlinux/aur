# Maintainer: Josef Vybíhal (josef.vybihal@gmail.com)

pkgname=ms-teams
pkgver=1.2.00.32451
pkgrel=1
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365.
 Instantly access all your team’s content from a single place where messages, files, people and tools live together."
arch=('x86_64')
url="https://teams.microsoft.com/start"
#license=('custom:ms-teams')
depends=('libgnome-keyring' 'pango' 'libsecret' 'gtk3' 'gdk-pixbuf2' 'cairo' 'fontconfig' 'dbus' 'glibc' 'glib2' 'gcc-libs' 'libxss' 'libxtst' 'nss') #?? FIXME
optdepends=('libdbusmenu-glib' 'alsa-lib' 'libnotify') ##??
provides=("ms-teams=${pkgver}")
options=('!emptydirs' '!strip')
install=${pkgname}.install
_source_arch="amd64"
#[ "${CARCH}" = 'x86_64' ] && _source_arch="amd64"
source=("teams_${pkgver}_${_source_arch}.deb::https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_${pkgver}_${_source_arch}.deb")
sha256sums=('28d8a0e644a4bb9d4ee9295953b97b7fa6558b8a9d1d28363a594f5cde1c05dc')

package() {
  msg2 "Extracting the data.tar.xz"
  tar -xf data.tar.xz -C "${pkgdir}/"
}
