# Maintainer: Debba <andrea@tabularis.dev>
# Shared by tabularis-bin (stable) and tabularis-nightly-bin: aur.yml rewrites
# pkgname, pkgver, pkgdesc, _tag and _debver per channel before publishing.
pkgname=tabularis-nightly-bin
_pkgname=tabularis
pkgver=0.32.1.nightly3
pkgrel=1
_tag=nightly-20261112-066e41c
_debver=0.32.1-3
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server (nightly build)"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${_debver}_amd64.deb::${url}/releases/download/${_tag}/${_pkgname}_${_debver}_amd64.deb")
sha256sums=('61dd5504751dc5a1594d0482c808cf640f996479d5d521d3821539301530931c')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
