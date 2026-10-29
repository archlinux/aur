# Maintainer: maxDTM <265972625+maxDTM at users dot noreply dot github dot com>
pkgname=fabricad-bin
_pkg=${pkgname%-bin}
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast, lightweight parametric 3D CAD (parts, assemblies, drawings) on Qt 6 and OpenCASCADE (prebuilt)'
arch=('x86_64')
url='https://github.com/maxDTM/fabricad'
license=('LGPL-2.1-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'opencascade'
  'qt6-base'
  'qt6-svg'
)
provides=("$_pkg=$pkgver")
conflicts=("$_pkg")
options=('!strip' '!debug')
_asset="$_pkg-$pkgver-$pkgrel-x86_64.tar.zst"
source_x86_64=("$_asset::$url/releases/download/v$pkgver/$_asset")
noextract=("$_asset")
sha256sums_x86_64=('e0aa851608fb122545e65a59b39a73323d6eba3d5f17d081277eb75da7393c65')

package() {
  bsdtar -xpf "$srcdir/$_asset" -C "$pkgdir"
}
