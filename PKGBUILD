# Maintainer: Josef Vybíhal (josef.vybihal@gmail.com)

pkgname=ms-teams
pkgver=1.2.00.29659
pkgrel=1
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365. Currently *only for insiders* on linux."
arch=('x86_64')
url="https://teams.microsoft.com/start"
#license=('custom:ms-teams')
depends=('gnome-keyring' 'libgnome-keyring' 'pango' 'libsecret' 'gtk3' 'gdk-pixbuf2' 'cairo' 'fontconfig' 'dbus' 'glibc' 'glib2' 'gcc-libs' 'libxss' 'libxtst' 'nss') #?? FIXME
optdepends=('libdbusmenu-glib' 'alsa-lib' 'libnotify') ##??
provides=("ms-teams=${pkgver}")
options=('!emptydirs' '!strip')
install=${pkgname}.install
_source_arch="amd64"
#[ "${CARCH}" = 'x86_64' ] && _source_arch="amd64"
source=("teams-insiders_${pkgver}_${_source_arch}.deb::https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/teams-insiders_${pkgver}_${_source_arch}.deb")
sha256sums=('cb97d322b8b50cfd17aa03860c25947531f4e5631e67dd9a50f02a566aeb3e61')

package() {
  msg2 "Extracting the data.tar.xz"
  tar -xf data.tar.xz -C "${pkgdir}/"
}
