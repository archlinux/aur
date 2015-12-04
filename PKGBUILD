#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.4.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(python3 powerpill python3-xcpf python3-aur pm2ml pbget)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.1.tar.xz.sig
)
sha512sums=(
  111327b8a33f993f482ac5068d260bd205a525db2884f177ed222e6527dd3d282b70d9fe632ab7932b5f17b9ed4416c870e5a27dd355033ae36adebc4ccfc48a
  3840a1b20262766b04e79a42eff631abd585a3e4172ff595213dfdc3ba468024bb98a756395f8494f1dacd463345938bdf2a4a8a74e6d96d31a1ae14039b274c
)
md5sums=(
  71c8858ec1223147c7e00619ae181f99
  b03bd21bfa6ccacde691bcd6c15d5fe4
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 "bauerbill.json" "$pkgdir/etc/bauerbill/bauerbill.json"
  install -Dm644 "man/bauerbill.json.1.gz" "$pkgdir/usr/share/man/man1/bauerbill.json.1.gz"
  install -Dm644 "bauerbill-bash-completion.sh" "$pkgdir/usr/share/bash-completion/completions/bauerbill"
  for bb in bauerbill bb-*
  do
    if [[ -x $bb ]]
    then
      install -Dm755 "$bb" "$pkgdir/usr/bin/$bb"
    fi
  done
}

# vim: set ts=2 sw=2 et:
