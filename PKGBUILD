#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2015.12.19.2
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.12.19.2.tar.xz
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.12.19.2.tar.xz.sig
)
sha512sums=(
  e6fc6d437952d7ed2db9aa57d9f22c9600b4b2b7a57cadc6e60b81ac10f53c9d9cc1431018e5f197b80039d90f508c1743f57fdd51903a5a2e438900b197b7db
  af918c6b60de3cf5fc7d08bae579beca189eb86233b9e3e0fa9ee65ce1af3de3ae4b908ca0bb19d07dd5f6b1e04b2bc7b6417cad4b8716bd107e656bc2956cf6
)
md5sums=(
  3faedccd5f81963dac2e9a276b7d5c4a
  22c8a4326345f7f89ed0be3f7c4957d9
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
