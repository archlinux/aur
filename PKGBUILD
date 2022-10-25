# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=atom-bin
_pkgname=${pkgname/-bin/}
pkgver=1.60.0
pkgrel=2
pkgdesc='A hackable text editor for the 21st Century. Repackaged .deb / binary release.'
arch=('x86_64')
url="https://github.com/atom/atom"
license=('MIT')
depends=('apm' 'electron11-bin' 'libxkbfile' 'ripgrep')
optdepends=('ctags: symbol indexing support'
            'git: Git and GitHub integration'
            'hunspell: spell check integration')
provides=('atom')
conflicts=('atom')
options=(!emptydirs)
_archive="$_pkgname-amd64"
#https://github.com/atom/atom/releases/download/v1.60.0/atom-amd64.deb
source=("$url/releases/download/v$pkgver/$_archive.deb")
sha256sums=('5c7c0259062b9d4911d2537bfceaff5316f9de111698840a90d7cd497df891a6')

package() {
	cd $pkgdir
	tar -xpf ${srcdir}/data.tar.xz
	rm $pkgdir/usr/bin/apm
}
