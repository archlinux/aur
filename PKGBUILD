# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>, Kyle Bronsdon <kyle at silksow dot com>
pkgname=linvst-bin
majorVersion=4.9
pkgver="$majorVersion"
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst')
optdepends=('jack')
source=("$url/releases/download/$majorVersion/LinVst-$majorVersion-wine-10.x-arch.zip")
sha256sums=('08a09b3f6311ef695d5fb3fa90e883b945ae8cef8977dfa9506a9cabf9b1aff4')

package() {
	install -d "$pkgdir/usr/bin/"

	# All lin-vst-server files
	install -Dm755 "$srcdir/LinVst-$majorVersion-wine-10.x-arch/lin-vst-server"* "$pkgdir/usr/bin/"

	# Shared library
	install -Dm755 "$srcdir/LinVst-$majorVersion-wine-10.x-arch/linvst.so" "$pkgdir/usr/share/LinVst/linvst.so"

	# Converter
	install -Dm755 "$srcdir/LinVst-$majorVersion-wine-10.x-arch/linvstconvert" "$pkgdir/usr/bin/linvstconvert"
}
