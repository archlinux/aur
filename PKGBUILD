# Maintainer: Yiğit Salar <yigit.salar7 (at) gmail (dot) com>
_pkgname=DumpToolbox
pkgname=dumptoolbox-bin
pkgdesc="A cross-platform .NET 8 and Avalonia desktop application for disc-image conversion, checksum-based recovery, and reconstruction from Redumper, DiscImageCreator, and PlayStation 3 IRD metadata"
pkgver=0.8.109
pkgrel=1

url="https://github.com/wiggy2k/$_pkgname"

license=('GPL-3.0-or-later')
arch=('x86_64')
options=('!strip' '!debug')

provides=('dumptoolbox')
conflicts=('dumptoolbox')

source=("$url/releases/download/$pkgver/Linux-x64-v$pkgver.zip"
"$_pkgname-$pkgver.zip::$url/archive/refs/tags/$pkgver.zip")

sha1sums=('2fd34afdbff3f910c96f5520a893af24713764a8'
'6af1dcd20234f3d8ffc185ba7ddc759f93cb69c8'
)

package() {
	# Install DumpToolbox distribution
	install -Dm755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname

	# Install README.md
	install -Dm644 $srcdir/$_pkgname-$pkgver/README.md $pkgdir/usr/local/share/doc/$_pkgname/README.md

	# Install LICENSE
	install -Dm644 $srcdir/$_pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
