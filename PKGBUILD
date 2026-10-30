# Maintainer: Debba <andrea@tabularis.dev>
# Shared by tabularis-bin (stable) and tabularis-nightly-bin: aur.yml rewrites
# pkgname, pkgver, pkgdesc, _tag and _debver per channel before publishing.
pkgname=tabularis-nightly-bin
_pkgname=tabularis
pkgver=0.30.1.nightly4
pkgrel=1
_tag=nightly-20261030-d28f9fe
_debver=0.30.1-4
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server (nightly build)"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${_debver}_amd64.deb::${url}/releases/download/${_tag}/${_pkgname}_${_debver}_amd64.deb")
sha256sums=('c19ca13e01d2f1e42cd97e7a33ccd85b73cf6f9838ed9fac4a166cb4c86b9a22')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
