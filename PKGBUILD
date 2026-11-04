# Maintainer: Debba <andrea@tabularis.dev>
# Shared by tabularis-bin (stable) and tabularis-nightly-bin: aur.yml rewrites
# pkgname, pkgver, pkgdesc, _tag and _debver per channel before publishing.
pkgname=tabularis-nightly-bin
_pkgname=tabularis
pkgver=0.31.1.nightly1
pkgrel=1
_tag=nightly-20261104-1f65b0b
_debver=0.31.1-1
pkgdesc="Open-source desktop SQL workspace for PostgreSQL, MySQL/MariaDB, SQLite and 15+ more databases, with a built-in MCP server (nightly build)"
arch=('x86_64')
url="https://github.com/TabularisDB/tabularis"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'libsecret')
source=("${_pkgname}_${_debver}_amd64.deb::${url}/releases/download/${_tag}/${_pkgname}_${_debver}_amd64.deb")
sha256sums=('511327d73fbfe9756a69392f3b62a425a92a8d2973a44fc084d7a9cebe8e58cb')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
