## Maintainer: Cain Atkinson <yellowsink@protonmail.com>

pkgname=docfx
pkgver=2.58.9
pkgrel=1
pkgdesc="Tools for building and publishing API documentation for .NET projects"
arch=('x86_64')
url="https://dotnet.github.io/docfx/"
license=('MIT')
groups=()
depends=(mono-msbuild)
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
source=("docfx.zip::https://github.com/dotnet/docfx/releases/download/v$pkgver/docfx.zip"
		"run.sh")
noextract=("docfx.zip")
sha256sums=("18e2277704b318d5c785681b69296aa072eca30ee5cab5b19de77ede830bbd3c"
			"d7d9862b9d522c46587d21c5a88fde741cf12542587649426662b79921a6e3b0")

package() {
	# make dirs
	install -d "${pkgdir}"/opt/docfx
	install -d "${pkgdir}"/usr/bin

	# unzip
	unzip -qq docfx.zip -d docfx
	chmod 755 docfx docfx/docfx.exe
	cp -a docfx/* "${pkgdir}"/opt/docfx/

	# copy script
	install -Dm 755 run.sh "${pkgdir}"/usr/bin/docfx
}
