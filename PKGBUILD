# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
_pkgauthor='acelot'
_pkgname='termtastic'
pkgname="${_pkgname}-bin"
pkgver=1.0.0_alpha4
pkgrel=1
pkgdesc='Feature-rich handmade Meshtastic console client'
arch=('x86_64' 'aarch64')
url='https://github.com/acelot/termtastic'
license=('GPL-3.0')
depends=('gcc-libs')
optdepends=(
)
provides=('termtastic')
conflicts=('termtastic')

source_x86_64=("https://github.com/acelot/termtastic/releases/download/v${pkgver/_/-}/termtastic-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/acelot/termtastic/releases/download/v${pkgver/_/-}/termtastic-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('2339cab7da5e05fa1a2a8ef2626816e8b9c0111c42f66902dfbe8cd19acaa65e')
sha256sums_aarch64=('9c9c8a58a51ffb3cdfc06960b414ed20014fba74feb9ffd799126d76e708c595')

package() {
	ls "$srcdir" || exit 1
    install -Dm755 "$srcdir/termtastic"      "$pkgdir/usr/bin/termtastic"
}
