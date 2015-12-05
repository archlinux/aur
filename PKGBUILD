#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.5.3
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.3.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.3.tar.xz.sig
)
sha512sums=(
  2055258af6a3cdce50854531f2a19ce5c242ebb2639aab69bb50706e2c3fa2a628a88f0fc6690694c6e5a81ab748f276b1c338bdd30c3c456684892ad7c449c2
  87b771c0dfefa7668979bdc833ac78ceb0ae51b50102c02c643c18b45d306e9c6846d916657a77abf3b9ed3d40b12e7b853f6388a7685066ae91d11f6035d2d6
)
md5sums=(
  a9a72228622ffdf818a56a6def8af0fa
  76035f1a7bc93340d5c59da67ab21dd8
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
