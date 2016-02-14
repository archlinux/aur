#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.2
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.2.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.2.tar.xz.sig
)
sha512sums=(
  7bb2d71d0d593447ff2d706fd1bd325fcef4cc52458cd7e7a63eff1a56a122c6fd13c0c265297adaaedf6258d72ffd48aa92d169d49d17ec1d1130b98ab70074
  cd42493a66498fdf3558250d5ab2253ab385f2aa2947f9601ed2768b515003240cc308d97d02aec61ded1a3a82e75f1b6fbe9e472282b132f6508bf313571bd7
)
md5sums=(
  4f694da8155127cd3af3f46ba475c962
  569d8c8f2b019fd6f12e5630d9f8c8d3
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
