# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

_pkgname=libtde
pkgname=libtde-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='What TDE applications share: configuration, theme, window frame and dialogs'
arch=(x86_64)
url='https://github.com/zskamljic/libtde'
license=(GPL-3.0-or-later)
depends=(
  glibc
  libgcc
  libstdc++
  lua
  qt6-base
  qt6-svg
)
optdepends=(
  'librsvg: drawing icons that Qt draws with black patches'
  'adwaita-icon-theme: fallback for icons missing from the icon theme'
)
provides=("$_pkgname=$pkgver" 'libtde.so')
conflicts=("$_pkgname")
# Built by the release workflow of the sources' repository, from the tag.
source=("$_pkgname-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.zst")
noextract=("$_pkgname-$pkgver-x86_64.tar.zst")
sha256sums=('a39892b06e3acb84fdc527101a14fcc90edb3debdac7a06186813611e6414871')

package() {
  bsdtar -xf "$_pkgname-$pkgver-x86_64.tar.zst" -C "$pkgdir"
}
