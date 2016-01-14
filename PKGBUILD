#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pm2ml
pkgver=2016
pkgrel=1
pkgdesc='Generate metalinks for downloading Pacman packages and databases.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pm2ml"
depends=(pyalpm python3 python3-xcgf python3-xcpf)
optdepends=('aria2: ppl script support.' 'python3-aur: AUR support' 'reflector: Reflector support')
backup=(etc/ppl.conf)
source=(
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2016.tar.xz
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2016.tar.xz.sig
)
sha512sums=(
  b211daa27039191ac2662c51d347eff6087ef23ce99b7e484d839c7e11df5e106429c0d7cf62c61ed7f912ef04e88f43e95600350fe433b4be77609b7cca818b
  fb2063fa0e53a486d3c0a849233503ff794dd88359935964b18aa769e875dc7ba715e47d8a2d616c267d96e90ce32ce9a7f9d01af5d6ba9829273b2f7110408f
)
md5sums=(
  dfa6d453faf32dae8aa2eae0b08824b7
  5506b377925eff979b9b8348ea5059cd
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
