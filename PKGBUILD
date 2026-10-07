# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-bin
pkgver=0.8.2
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
sha256sums_x86_64=('1a12393fdb1fc36ef4c0339609b2652d6a0f7bb4a5f6c08da4afe1d364422d18')
sha256sums_aarch64=('9c88e352173d913a8202637f22030d1521d0f6085e34c39961b2bc2745837d9f')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/${_pkgname}db
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
