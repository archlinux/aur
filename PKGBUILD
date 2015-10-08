#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pm2ml
pkgver=2015.10
pkgrel=1
pkgdesc='Generate metalinks for downloading Pacman packages and databases.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pm2ml"
depends=(python3 pyalpm python3-xcpf)
optdepends=('reflector: Reflector support' 'aria2: ppl script support.' 'python3-aur: AUR support')
backup=(etc/ppl.conf)
source=(
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.10.tar.xz
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.10.tar.xz.sig
)
sha512sums=(
  f33d9147372920602dff5faf59e2921705923bebab4e9907c8d1993c440a035dfbcb1006a4fd518490603e08a5fa9fcb50d3e608016ab57aea19e846fa242f2e
  24e3a9939315cdfc7a1fd9f552c42a90f3d817f408ebe23ccd2854f8ee77e3d3dfb32ac216dc3321c3cca9074f9cbfe1e6f624fefb405c815d9a8aa3395d24ff
)
md5sums=(
  70c77eda9d14c7e7f0d924492a2ff42d
  2f91cc5cd468af93aa565ae13ad13386
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
