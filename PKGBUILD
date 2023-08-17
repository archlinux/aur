# Maintainer: Procursus Team <team@procurs.us>
# Maintainer: sunchipnacho, Procursus Team
# Contributor: Keto, Procursus Team
# Contributor: Cameron Katri, Procursus Team

pkgname=ldid
pkgver=2.1.5procursus7
_pkgver=2.1.5-procursus7
pkgrel=1
pkgdesc="Put real or fake signatures in Darwin binaries - Procursus fork"
provides=('ldid' 'ldid2')
conflicts=('ldid2')
replaces=('ldid2')
arch=('x86_64' 'aarch64')
url="https://github.com/ProcursusTeam/ldid"
license=('AGPL')
depends=('openssl' 'libplist')
source=("https://github.com/ProcursusTeam/ldid/archive/v$_pkgver.tar.gz")
b2sums=('e30db705bb5cc8d4177725f98184b25407df1f338984ccfe9a6874e85077443b5b78e0c2a90c48f0b50af914630be8b759ad6efcd067208b69906883b821c54b')

build() {
	make -C ldid-$_pkgver
}

package() {
	make -C ldid-$_pkgver install DESTDIR="$pkgdir" PREFIX="/usr"
}
