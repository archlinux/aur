#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-aria2jsonrpc
pkgver=2021
pkgrel=15
pkgdesc='A wrapper class around Aria2'"'"'s JSON RPC interface.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-aria2jsonrpc"
depends=(python3)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2021.tar.xz
  https://xyne.dev/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2021.tar.xz.sig
)
sha512sums=(
  97786fe2f7cc227b41c540d743c1212ccbb9a82d9f7acff00a32d6a1a241e9d4a8109113490c72f1f43aae55784cae09ad6fb8751c6806fbf15c3d6d67933b47
  5682e6b853637623c13803abebff033053319d9cea2780092d384e768a10c371deed496654e194b8c6529ad1b9cc10cd8acc6498da164b56be2aca10cd63d826
)
md5sums=(
  83004437b5f272471fe016655302e35f
  25f7418e2e1937cefd5975b441a7da56
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for exe in a2jrg{,-scrape}
  do
    install -Dm755 "$exe" "$pkgdir/usr/bin/$exe"
  done
}


# vim: set ts=2 sw=2 et:
