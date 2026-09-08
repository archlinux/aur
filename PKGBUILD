# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-bin
pkgver=0.7.2
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
sha256sums_x86_64=('321e401e44f7ee8ea656caff0f85304025f7e905acafe7bedf6a9304f1af1783')
sha256sums_aarch64=('e13b2017961173a3280dfed64d5e76d6a17e5b30960540da991df20fd0455f10')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/${_pkgname}db
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
