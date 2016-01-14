#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.1.14.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.1.tar.xz.sig
)
sha512sums=(
  e0f18def7826e2342e545fe9c7560fce7107cb1cfc8a670e107ced1fb2543595b8e58d3f28d4d86fc154c84bd94bde9d64e543df26767aba7a8afc2f997402ea
  0a12e9579acdf4f021b637cbc8f5f46bac46c54842e40cfa9574705e4a2012a3186bf98e3fadf705c2469e7bc41162e0f2354cd5169d4c128ecca2afaf581615
)
md5sums=(
  3958868db7073ef1bdbc51acd34eef30
  ce158ebe638d3dbaed587c318d355ef1
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
