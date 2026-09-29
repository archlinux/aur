# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-bin
pkgver=0.8.0
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
sha256sums_x86_64=('2df6c9854d75806f98e896845cc12e516843069c3543ae69eb8b9d96a42cefd4')
sha256sums_aarch64=('67bd89d5dc8a781073c2ea04f200e7b9d6a6b8eb2dfb9a5fdad0842dd8956f55')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" ./**/${_pkgname}db
    install -Dm644 ./**/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
