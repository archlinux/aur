# Maintainer: rapiertg <rapiertg@gmail.com>
_pkgname=virtualmoon
pkgname=virtualmoonatlas
pkgver=8.2
pkgrel=1
pkgdesc="Software for Moon observation and survey"
arch=('x86_64')
url="https://www.ap-i.net/avl/en/start"
license=('GPL2')
makedepends=()
depends=('gtk2')
provides=('virtualmoonatlas')
conflicts=('virtualmoonatlas-git')
source=("virtualmoon_${pkgver}_amd64.deb::https://sourceforge.net/projects/virtualmoon/files/1-%20virtualmoon/Version%208.0/virtualmoon_${pkgver}_amd64.deb/download"
	"virtualmoon-basedata_${pkgver}_all.deb::https://sourceforge.net/projects/virtualmoon/files/1-%20virtualmoon/Version%208.0/virtualmoon-basedata_${pkgver}_all.deb/download")
sha256sums=('2c41599fc15c759794857d8ca15c681dfac7c8e2eb5eb0b71aab3b5d6a43ef30'
            '860d4b6a545721bcb420b4b45ad7b1487697af1888c2e2acb3f582dc79e9cb91')

extract_deb() {
	local tmpdir="$(basename "${1%.deb}")"
	rm -Rf "$tmpdir"
	mkdir "$tmpdir"
	cd "$tmpdir"
	ar x "$1"
	tar -C "${pkgdir}" -xf data.tar.xz
}

package() {
	extract_deb "${srcdir}/virtualmoon_${pkgver}_amd64.deb"
	extract_deb "${srcdir}/virtualmoon-basedata_${pkgver}_all.deb"
}
