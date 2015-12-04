#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.4
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(python3 powerpill python3-xcpf python3-aur pm2ml pbget)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.tar.xz.sig
)
sha512sums=(
  d35e9c8d12de580049e99c76425d9a0d0d2aab8d059bece3fdddd5605a40ffa23247ec6328ad3daa09ce623f2e307c2824c52554bded4a360795d42f939c332a
  a8b82ed643e23b2cfaea1b910a3716cbf46b42ebad04d974dc239f39608b22999eb50bddabfde6a1e76b868a0488ce8e25b56c6681a1e718bad45e8cd916341c
)
md5sums=(
  5929b48871dcc793df2dc05b5658e9a0
  6f2ea3eb4296a27518d5eb7b82459ad6
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
