#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-aria2jsonrpc
pkgver=2021
pkgrel=2
pkgdesc='A wrapper class around Aria2'"'"'s JSON RPC interface.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-aria2jsonrpc"
depends=(python3)
source=(
  https://xyne.dev/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2021.tar.xz
  https://xyne.dev/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2021.tar.xz.sig
)
sha512sums=(
  97786fe2f7cc227b41c540d743c1212ccbb9a82d9f7acff00a32d6a1a241e9d4a8109113490c72f1f43aae55784cae09ad6fb8751c6806fbf15c3d6d67933b47
  ef7d9e486c688b1d42a5aa1546b6dc6444159350a106302915e1fb5aa2b2e8d2be2b330b2a028cbc263617c181cc646d7736d1a4c88fe569f482c992a2af0b25
)
md5sums=(
  83004437b5f272471fe016655302e35f
  45cbde1097940b041406611004671976
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

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
