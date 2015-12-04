#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.4.3
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(python3 powerpill python3-xcpf python3-aur pm2ml pbget)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.3.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.3.tar.xz.sig
)
sha512sums=(
  ef0afa4a40447f12b1b88802bf94e860445bade87da796843bbeb47c5799c4a0b4c2203c3c816606810021889f6757573453ed81bcc711306055f15514f3c565
  03e1502bab098668457db49a6095ca9fc9b283650199c650669fc2a72259f2b0b7976f060f251bb52dee88d07acf3a5e067547215d6e95b0bc84d9a439ab110f
)
md5sums=(
  5891b1713519808408fb6e103525e256
  4e77e8b9fa6f1f2fb6cfcf76fe663101
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
