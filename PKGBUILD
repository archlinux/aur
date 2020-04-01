# Maintainer: Korbinian Schildmann <aur@schildmann.net>

pkgbase=freeman-korbi-gitlab-bin
pkgname=(freeman-korbi-gitlab-bin)
pkgver=0.2.269
pkgrel=1
pkgdesc="freeman"
makedepends=('git' 'tar')
arch=('x86_64')
license=('GPL3')
options=(!strip)
source=("${pkgbase}::git+https://gitlab.com/kschildmann/freeman-bin.git")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"

	mkdir -p $pkgdir/usr/bin/
	install -m 755 freeman $pkgdir/usr/bin/freeman

	mkdir -p $pkgdir/etc/
	install -m 644 freeman.json $pkgdir/etc/freeman.json

	mkdir -p $pkgdir/etc/freeman.d/
	install -m 644 freeman.d/* $pkgdir/etc/freeman.d/

}
