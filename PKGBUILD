#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2021.12.31
pkgrel=14
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/bauerbill"
depends=('pacman>=5.2.0' pbget pm2ml powerpill python-pyxdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
makedepends=(python-setuptools)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.12.31.tar.xz
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.12.31.tar.xz.sig
)
sha512sums=(
  8c781cb1e78326f900928205fd10a4512402c648e3188c927dd4a354f11f38e13e6f1d53fd0fd57ce46e46f32fa7fc70333666b3ef7d57ca1eae5554c17ceb45
  30695921d547f5f2c9a325789b620c721113eb7553830924bc15dd5d649504cc09a5fd5d1ff7ddeca276fe5cd9911bbb5d3e77beb8e37b08af13c1b0f94052a6
)
md5sums=(
  0d6bbf2f8c1e6c07630c553e9951a7a1
  71f19748d4cf849e6418db7d2f17c855
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 "bauerbill.json" "$pkgdir/etc/bauerbill/bauerbill.json"
  install -Dm644 "man/bauerbill.json.1.gz" "$pkgdir/usr/share/man/man1/bauerbill.json.1.gz"
  install -Dm644 "bauerbill-bash-completion.sh" "$pkgdir/usr/share/bash-completion/completions/bauerbill"
  install -Dm755 "bb-wrapper" "$pkgdir/usr/bin/bb-wrapper"
  install -Dm755 makepkgx "$pkgdir/usr/bin/makepkgx"
}

# vim: set ts=2 sw=2 et:
