#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.1.20.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.20.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.20.1.tar.xz.sig
)
sha512sums=(
  5b2819ab4487a7f410cf73b949835159adb24599a7a7e706aaafcd626f2080166366da07116689d849b723b6f04d3ddcffb87e5acc830442691c32433a89f86f
  778c63e7bebd158f45a452e63ef32d3b566a1672023baae45ef1ecb5c99f8fe61ce6662a2e23f28629210938ae17d21775df499b5ce5ca7e7c24b82bea769e26
)
md5sums=(
  9f45847b33d9c82747c9b612e5e2cb13
  a34c36e33cbce0a06d16cae19cfa7e2f
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
