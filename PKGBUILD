# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=(glibc libgcc)
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/${_pkgname}_cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/${_pkgname}_cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('b4b94f334cc8ccbf6a7cde1aa7c2949acbc51c83dc41680192a47bd619c021eb')
sha256sums_aarch64=('a1dfe53b18e273beb97e91f32e57148692e0529450d0db85234a524b5dfafd37')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/${_pkgname}db
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
