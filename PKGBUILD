# Maintainer: TomRhodan <tomrhodan at gmail dot com>
pkgname=penguin-citizen-bin
_pkgname=penguin-citizen
pkgver=0.5.6
pkgrel=1
# Upstream uses Debian-style release suffix in tags (e.g. v0.5.4-0). Independent of pkgrel.
_releasetag=0
pkgdesc="A Linux management tool for Star Citizen — RSI Launcher GUI with Wine/Proton runner management"
arch=('x86_64')
url="https://github.com/TomRhodan/penguin-citizen"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
optdepends=(
    'wine: alternative to Proton runners'
    'lutris: optional game launcher integration'
    'gamemode: performance tuning'
    'mangohud: in-game performance overlay'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!emptydirs')
source=("$_pkgname-$pkgver.deb::$url/releases/download/v${pkgver}-${_releasetag}/Penguin.Citizen_${pkgver}_amd64.deb")
sha256sums=('6ce2f35ee21fe96b482e39cbe1c25200f0ec9c1317c1d7f0e7a42a7da54ee86b')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
