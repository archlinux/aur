#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aria2jsonrpc
pkgver=2016
pkgrel=5
pkgdesc='A wrapper class around Aria2'"'"'s JSON RPC interface.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-aria2jsonrpc"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2016.tar.xz
  https://xyne.archlinux.ca/projects/python3-aria2jsonrpc/src/python3-aria2jsonrpc-2016.tar.xz.sig
)
sha512sums=(
  70e81743d0e937f755f61eb5c7b0d04c436aa283be2f7a35ff1cc8af8eacf7053745e433945318683e053cee4b53c82485e30c0e09b109e9db0c392ffab255a6
  1d57739b196078823f7b88c2453e00a8fe4ae1a79e523cc05630604a3bd5ceb21daa20a3924b4ae27d39ef254a195d3e15dd9273b2d4d49299e6b1ef871cea20
)
md5sums=(
  c3137077ee1f3ee41150e9b1b657cc15
  254fda60024665473d35ceeddf17d56b
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
