# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=restate-server
pkgver=1.3.2
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
sha256sums=('1762b576c2ce8ae9e24214fbcef9dbc580adff6ccd667d57bcb2db02a9169094'
            '5345cfcd6b9fc4a1957c279f500a02bd554c9449e122c7b8e91b74c6ae97c5ab'
            '88660438134c7e01d96919b33e215a83456c847bd317c17dc8c8d4a5faccb989'
            'a602e5a6f17f5d424ab2a6c85b216846528d93db30eb9604631882921cbb3cdf')
sha256sums_x86_64=('1a308857c944f528d2c184850857604c3c123d83724be185bc9740da41096867')
sha256sums_aarch64=('30286cf16d34c81f5b4c0cc9d3e4e6df937376211cfc88c3963a39b408e28917')
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
