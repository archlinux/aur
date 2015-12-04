#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(python3 powerpill python3-xcpf python3-aur pm2ml pbget)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.tar.xz.sig
)
sha512sums=(
  eb5c1a793a356cdbb34e0ad948abfb05d771ca60d4549ce130c3f86e353ad38b509f4980ed4a93120089cec203099adf520a48b206e8d7c7324320440ecbbb7f
  4eab7a36dc9463c28df018c672ed3dee89a1a774d62da1ba911b6aaa269ce5ce5f530e3e8cdf70f62f4c024b272e7ea899aa089df4cb302bb9e67e734f6055b5
)
md5sums=(
  617ec08d4f746f1c02cfdddbd6a8130c
  6859ce7d8f46068c1eb3996be456831b
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
