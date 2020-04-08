#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aria2jsonrpc
pkgver=2019
pkgrel=1
pkgdesc='A wrapper class around Aria2'"'"'s JSON RPC interface.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-aria2jsonrpc"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2019.tar.xz
  https://xyne.archlinux.ca/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2019.tar.xz.sig
)
sha512sums=(
  9ddf101b0b643aa034a23774cfaaab8901c81acd1a013917ad26c564a992db0f38549047092c2e219f1f959abf71caeb5940ee84deb9f3ecc3173466d3e136a5
  5465abc09c631497290297805773fceb24a105cb881c4ac797e380e0bbf07c6a108bf5435c1b0460bd648f021c07fd6eaa88ae1c7100d8ad1b36f5de6ee63ae3
)
md5sums=(
  290529a1dc72db587d4a3ee1bce4865f
  c383b4cc66f2aae99c646acc64e6e1b4
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
