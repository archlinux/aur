# Maintainer: Denis Kopin <deng@lixun.app>
pkgname=lixun-semantic-bin
_pkgname=lixun-semantic
pkgver=0.7.10
pkgrel=1
pkgdesc="Lixun semantic sidecar worker: dense-vector hybrid retrieval via fastembed + LanceDB"
arch=('x86_64')
url="https://lixun.app"
license=('MIT OR Apache-2.0')
options=(!debug !strip)
depends=("lixun=$pkgver" 'gcc-libs' 'xz' 'libheif')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
_archive="${_pkgname}-$pkgver-1-x86_64.pkg.tar.zst"
source=("https://github.com/dengkeping/lixun/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('117bf53837f289f784a8942b7d3ca9e85d62e48d5004b725302457d2803e07c3')

package() {
  bsdtar -xf "$srcdir/$_archive" -C "$pkgdir" usr
  ln -s "$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
