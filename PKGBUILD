# Maintainer: missing <liri_bucketful at slmail dot me>

_pkgname=guc
pkgname=guc-git
pkgver=r2.a4dc616
pkgrel=3
pkgdesc='Checks for updates in Git repositories'
arch=('any')
url='https://codeberg.org/missing-semi-colon/guc'
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('git' 'jq')
provides=("guc=${pkgver}")
conflicts=('guc')
source=('git+https://codeberg.org/missing-semi-colon/guc')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
