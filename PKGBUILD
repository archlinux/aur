#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.9
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.9.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.9.tar.xz.sig
)
sha512sums=(
  440fd5a2dd4e9fa88545f10ecef3511da2f5987c173d28d1f4cbf244c236a1445eb015324a9c0e78c82125dfb59a0d29eaf4badbc8b58f5e0ab746d4dd024985
  23b76774d2ea52cabd4cd855d495ec79418e7a11c3e5be076d7ab9fcac4bc9f9acdc1edb5eb32f844b3a0d94679d42aa8a0f555135b60555e94548452d28942a
)
md5sums=(
  5a71a452aac04725a668658bfbdc94a4
  9e910082656f3db9d22a0253d9591931
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
