# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=restate-server
pkgver=1.5.5
pkgrel=1
epoch=
pkgdesc="Building resilient applications made easy! (server)"
arch=('x86_64' 'aarch64')
url="https://github.com/restatedev/restate"
license=('BUSL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/restate.toml)
options=()
install=
changelog=
source=("restate.toml"
        "restate.service"
        "restate.sysusers"
        "restate-tmpfile.conf")
source_x86_64=("https://restate.gateway.scarf.sh/v${pkgver}/restate-server-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://restate.gateway.scarf.sh/v${pkgver}/restate-server-aarch64-unknown-linux-musl.tar.xz")
sha256sums=('7a0a1cb51229527e3b42c9da00240aa492c51d110537090f7d23cb2d883825ce'
            '5345cfcd6b9fc4a1957c279f500a02bd554c9449e122c7b8e91b74c6ae97c5ab'
            '88660438134c7e01d96919b33e215a83456c847bd317c17dc8c8d4a5faccb989'
            'a602e5a6f17f5d424ab2a6c85b216846528d93db30eb9604631882921cbb3cdf')
sha256sums_x86_64=('f867f050f9689c6b3909ba96b450e854c925fe27b77b9c90e16da222d03091aa')
sha256sums_aarch64=('0bed5d04d0da3f158828c675cc4c5b07a303d3c501859e7aa4e70b6a165e20ee')


noextract=()

package() {
  cd "$srcdir/restate-server-${CARCH}-unknown-linux-musl"

  install -Dm755 restate-server "$pkgdir/usr/bin/restate-server"
  install -Dm644 "$srcdir/restate.toml" "$pkgdir/etc/restate.toml"
  install -Dm644 "${srcdir}/restate.service" "${pkgdir}/usr/lib/systemd/system/restate.service"
  install -Dm644 "${srcdir}/restate.sysusers" "${pkgdir}/usr/lib/sysusers.d/restate.conf"
  install -Dm644 "${srcdir}/restate-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/restate.conf"
}

# vim:set ts=2 sw=2 et:
