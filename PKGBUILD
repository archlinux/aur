#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.23
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.23.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.23.tar.xz.sig
)
sha512sums=(
  8dbc24cabffd5474f93ac6f30ad9a4a684e0e7b9eb8714f48a1d40173f22ec37acf4ccbb53648f6aab679fb279ce3360eee16851119c3fceb419cbc13c345f03
  0f5094bf805cc58bf71a68957a927a56948e0164f7b11e429596c1893072e4a5019e86313babcd132226caeae527902bb5bc3d39910d0d918e9f902636f11076
)
md5sums=(
  453aa7dcad11517fff27096541f92c3a
  e2e0d395ec118a99effe7b93a1d5fe2a
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
