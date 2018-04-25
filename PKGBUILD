#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2018.4
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2018.4.tar.xz
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2018.4.tar.xz.sig
)
sha512sums=(
  0795475b85a76bc60b79cfdaad7a3f326a7fe464489c784c6cae258ef4ea3c79167b81ea27e10057ad44ea131221f3ca85ae75e3162f38877f86697ce085dba8
  b19d12130e8f536c489e811646f12c6ead2e98118d73b30d52f9ee11db222155e51b9c821eb9b62deeba10ca197fcbb7b8dc3c96ed77b7a16498dbea92a7e544
)
md5sums=(
  a10cb156ddd47926869ce80fb2f39886
  8c64feda48b0c4dee659d3efa6798ca9
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver/src"
  for pkg in pkg-* db-*
  do
    name="${pkg##*/}"
    install -Dm755 "$name" "$pkgdir/usr/bin/$name"
  done
}

# vim: set ts=2 sw=2 et:
