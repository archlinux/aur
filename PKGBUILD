#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.tar.xz.sig
)
sha512sums=(
  4a890261d9ff1b27b243e2f7ce354e4d52cd30e38c092c9049c6d6f32d2e424ab3676ff3a51666921b0eb939b38d377cba9dd2de4c41ddb78ff429a15823d9f3
  ca015a6713877a80006b529908854e71744290c32a16b36a6be3cc7a0d91162168d25a1a4e8407e8000e66f99a48991f32dbe91ec7febc197fa0137724bfdbcb
)
md5sums=(
  2bdd8a3c3f7c56f403e5a4bd5c3eae8c
  6aa1cf636f8a2d1346631ae36104d1b0
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
