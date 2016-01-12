#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.tar.xz.sig
)
sha512sums=(
  7ff38b8d5e3b3af4be3bf856f1944f3aa372aaf270d49cd1263a02589589ca7afcb1758615fc72ed0167e464b88e6430554a8c716a6af6ac170df3d5f4e695ec
  346e857b8e6c8a3b59c8be4e0e2ebdfb5888a7052dc53f44c1ad878545d9fbaf711b593611a19c592b11de25937e2af9b2d5871fe0bfab315761a4e3b1caab4d
)
md5sums=(
  5d5c806fc1a096df38a9907b458e1040
  3e8412f3f5e042413b9231f892286195
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
