# Maintainer: TomRhodan <tomrhodan at gmail dot com>
pkgname=penguin-citizen-bin
_pkgname=penguin-citizen
pkgver=0.5.8
pkgrel=2
# Upstream uses Debian-style release suffix in tags (e.g. v0.5.4-0). Independent of pkgrel.
_releasetag=2
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
sha256sums=('90f94e17cb1bd3e8062f3662a8d96bc1365cba74cc55b12ae7418b9355c1f0fc')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
