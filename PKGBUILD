# Maintainer: SeekyCt <seeky dot mkw at gmail dot com>

pkgname=szs-bin
pkgver=2.42a
pkgrel=1
epoch=
pkgdesc='Wiimms SZS Tools (wszst)'
arch=(x86_64)
url=https://szs.wiimm.de
license=('GPL-2.0-or-later')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(wbmgt wctct wimgt wkclt wkmpt wlect wmdlt wpatt wstrt wszst)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_archive=szs-v$pkgver-r8989-$arch
source=("https://szs.wiimm.de/download/$_archive.tar.gz")
noextract=()
sha256sums=('45c07b8e78fdc38868ac42dd50c1a2e14fc0f14695421b1b5c43134e17393ccc')
validpgpkeys=()

package() {
	cd "$_archive"

	install -Dm755 -t $pkgdir/usr/bin bin/*

  # The original install.sh supports this, but the tarball ships with no share folder
	# install -Dm644 -t $pkgdir/usr/share/szs share/*

	install -Dm644 -t $pkgdir/usr/share/doc/szs doc/*

  # TODO: 'scripts' and 'support' seem like they should go somewhere?
  #        But the original install.sh doesn't do anything with them...
}
