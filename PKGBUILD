#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pm2ml
pkgver=2015.12.6
pkgrel=1
pkgdesc='Generate metalinks for downloading Pacman packages and databases.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pm2ml"
depends=(pyalpm python3 python3-xcgf python3-xcpf)
optdepends=('aria2: ppl script support.' 'python3-aur: AUR support' 'reflector: Reflector support')
backup=(etc/ppl.conf)
source=(
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.12.6.tar.xz
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.12.6.tar.xz.sig
)
sha512sums=(
  8e83783d116b424325464e2e0134643caf2de3bfd5b796a68d875531eda5316c91cf2679c68dd37e61ada28981d594c2dc5d0746ad74433fac2e67ede88ed1e9
  316da5e8edb5895a824b35831373b2bed95f34426a02416ed1f4c269f001b4896cbdda79a7668aa684e75b8e32874ad409ed0384cd2aa91aa84fbfe203a66941
)
md5sums=(
  794cd02be97fcf741a57ff06e34d7ccb
  fb71991248d877b1ffcf8a0937ee4753
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
