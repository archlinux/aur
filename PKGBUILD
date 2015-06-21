#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aria2jsonrpc
pkgver=2014
pkgrel=1
pkgdesc='A wrapper class around Aria2'"'"'s JSON RPC interface.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-aria2jsonrpc"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2014.tar.xz
  http://xyne.archlinux.ca/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2014.tar.xz.sig
)
sha512sums=(
  0a9eedf1d3311ff3ade4730fe8b330c9d983c453801215f28f7ad6ef3ad818ae10faf137cece49cef22ec84b67ceb99b3b06796404f3e73666fbe57a5e2de406
  2dfbe594e39b6c4a99ab0c9d7718baf2f86f9d6765cb9fc9cd23df18d3150e3331ff83952eb98ef6efa26bca602a55c5b720b5cfede4fd8257fadeee5c6aba54
)
md5sums=(
  a155fef1b7713086e29bea8e9c05b946
  c581db85003c1e43d35e7c57c03fe92e
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
