## Maintainer: Cain Atkinson <yellowsink@protonmail.com>

pkgname=docfx
pkgver=2.60.2
pkgrel=1
pkgdesc="Tools for building and publishing API documentation for .NET projects"
arch=('x86_64')
url="https://dotnet.github.io/docfx/"
license=('MIT')
groups=()
depends=()
makedepends=(unzip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("docfx.zip::https://github.com/dotnet/docfx/releases/download/v$pkgver/docfx-linux-x64-v$pkgver.zip")
noextract=("docfx.zip")
sha256sums=("fba53cc4a2322d88ce06ca2d7eb40a5f7bb25b4cf8efd6c8a2c47a6b22ddb2b8")

package() {
	# make dirs
	install -d "${pkgdir}"/opt/docfx
	install -d "${pkgdir}"/usr/bin

	# unzip
	unzip -qq docfx.zip -d docfx
	chmod 755 docfx docfx/docfx
	cp -a docfx/* "${pkgdir}"/opt/docfx/

	# bin
	ln -s "${pkgdir}"/opt/docfx/docfx "${pkgdir}"/usr/bin/docfx
}
