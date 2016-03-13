#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.3.13
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.3.13.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.3.13.tar.xz.sig
)
sha512sums=(
  ff3686723886debb5b3634f3ea8824c6c9779a3aaf894ac287b2956a427f62662d9d512b2ce520e43a3af05a9b1546c22b586da495b491007472495f44290d7e
  8985e1ada9297eaccfa6cb4038ad496915375fae35e19302b7abbb159677c7d66858652c6702e89bd21ecfa21450afdab1403c3afa5fad4cbc9e77a293a55149
)
md5sums=(
  7eab65377a1b0058159efb3068349493
  4715326d8444ed935bcb77bf378a35b3
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
  install -Dm755 makepkgx "$pkgdir/usr/bin/makepkgx"
}

# vim: set ts=2 sw=2 et:
