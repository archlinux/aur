# Maintainer: tgiachi <tom@orivega.io>
pkgname=arrr-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Linux desktop notification aggregator daemon — aggregates RSS, IMAP, Teams and more into one place"
arch=('x86_64')
url="https://github.com/tgiachi/Arrr"
license=('MIT')
depends=('dbus' 'libnotify')
optdepends=(
    'libnotify: desktop popup notifications via D-Bus'
)
provides=('arrr')
conflicts=('arrr')
backup=()
install=arrr-bin.install
source=(
    "arrr-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/tgiachi/Arrr/releases/download/v${pkgver}/arrr-${pkgver}-1-x86_64.pkg.tar.zst"
    "arrr.service"
)
sha256sums=(
    '969d866befe56dbafd0d3e2c50770c5ccd6fb1eba87462de9c9f2cedaf51c635'
    'SKIP'
)
noextract=("arrr-${pkgver}-1-x86_64.pkg.tar.zst")

prepare() {
    bsdtar xf "arrr-${pkgver}-1-x86_64.pkg.tar.zst"
}

package() {
    install -Dm755 usr/local/bin/arrr "${pkgdir}/usr/bin/arrr"
    install -Dm644 arrr.service "${pkgdir}/usr/lib/systemd/user/arrr.service"
}
