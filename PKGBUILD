#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.1.22
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.22.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.22.tar.xz.sig
)
sha512sums=(
  8704c0fb28342ff55877bd776211cfa9831c5ad0add6c7de735d47aefc9c1a6411775a618cd0cc1b233b1f168dea99902e494997bdbbcee287a3ba94a68b05be
  4edffde282a26369b0f9779017dcb1c55828471c9727c7891e8f19815b9bf75a9266ecb2cf93dfb9e179308121ca138f819c653bce123b63b282772b42551610
)
md5sums=(
  6219fbfe84e0500fdd726cabef1558e1
  c1acbf65680a90fbe4d2fb47a7d5cd92
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
