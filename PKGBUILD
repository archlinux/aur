#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.19.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.19.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.19.1.tar.xz.sig
)
sha512sums=(
  f6ed2e47c2686164805d3b38459dd2f7ca9946615f097f8dffe461887bac25cf38b3f44ae4fb095b7ac67fb7ac940838568921935bf68f8e87e1a6f7f7c45382
  3375c5d0d3f98bfeb12ebdca811e7a919d9de2939c4a62782eb5b8c67232664e928ab62b2c08a03e5252d727faebae8b13173ced515d970cc61cdf058ed89aa7
)
md5sums=(
  696fe3b8eb5afb7ba4f49ba9978ade57
  6ff8b6075e986bbb4f950e887f9a40e3
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
