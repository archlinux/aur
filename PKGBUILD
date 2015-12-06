#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pm2ml
pkgver=2015.12.6.1
pkgrel=1
pkgdesc='Generate metalinks for downloading Pacman packages and databases.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pm2ml"
depends=(pyalpm python3 python3-xcgf python3-xcpf)
optdepends=('aria2: ppl script support.' 'python3-aur: AUR support' 'reflector: Reflector support')
backup=(etc/ppl.conf)
source=(
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.12.6.1.tar.xz
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.12.6.1.tar.xz.sig
)
sha512sums=(
  9e253b2cf4b98f5a9ce7dfa937ade5cd9f4881fa0b61c8fa1d0fc0e967e4fa537460c50b5e4834b5cefad7220cf5b31a28076d25c04f88db68b62888ce61cea2
  64a060b0bae36bce0b99549cbffda061dbeb4d29740cf29c5189b08cd8a06b28793c701033acd3e720475c3e1c05d4a257b57373355fd1e1d9059b3d2f9af09d
)
md5sums=(
  5cade67e6cfb3ec05923c007af94b790
  10ff31d3eca1b42f3bfe7bec28583245
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  for foo_ in ppl pplsyu ppls; do
    install -Dm755 "$foo_" "$pkgdir/usr/bin/$foo_"
  done
  install -Dm644 "ppl.conf" "$pkgdir/etc/ppl.conf"
}

# vim: set ts=2 sw=2 et:
