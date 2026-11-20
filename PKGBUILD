# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_pkgname=omnisharp-roslyn
pkgname=$_pkgname-bin
pkgver=2.0.0
_dotnet_ver=10.0
pkgrel=1
pkgdesc='OmniSharp server (STDIO) based on Roslyn workspaces'
arch=(x86_64)
url=https://github.com/OmniSharp/$_pkgname
license=(MIT)
depends=(dotnet-sdk-$_dotnet_ver glibc libstdc++ libgcc)
provides=($_pkgname)
conflicts=($_pkgname)
source=("omnisharp-linux-x64-$pkgver.tar.gz::https://github.com/OmniSharp/$_pkgname/releases/download/v$pkgver/omnisharp-linux-x64.tar.gz")
sha256sums=('0e756249cdc61950aabd50c9a74fb97d6aa77a05e4d76f26589caf96c639c013')
noextract=("omnisharp-linux-x64-$pkgver.tar.gz")
options=(!debug)

package() {
	install -dm755 "$pkgdir/usr/lib/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/bin"
	tar --no-same-owner -xf "omnisharp-linux-x64-$pkgver.tar.gz" -C "$pkgdir/usr/lib/$_pkgname"
	ln -s ../lib/$_pkgname/OmniSharp "$pkgdir/usr/bin/omnisharp"
	ln -s ../lib/$_pkgname/OmniSharp "$pkgdir/usr/bin/OmniSharp"
	mv "$pkgdir/usr/lib/$_pkgname/license.md" "$pkgdir/usr/share/licenses/$pkgname/license.md"
}
