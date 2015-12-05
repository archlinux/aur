#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.5.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.1.tar.xz.sig
)
sha512sums=(
  26d20445e6ea3ed8fc689e56fa66bc7dd37bb593ada253d34cb8b4a893ad5cab3745ea96aafd70a2e77ec672baeea471bb9da7a1dfdd3427e2c046cc35c4da6f
  6944e3d180c7bdae40e2d19ce15a341f307f6527a15c2f71d9c50c1cf3697a7187170abec03732324a1ac6df01238dca8cc08c1044d6ce22cb3db0b0423eddb3
)
md5sums=(
  c26d7701f4224e73482ccec1724d4d98
  5c75f6c35c8ae04979372861be6131b7
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
