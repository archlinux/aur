#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.5.2
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.2.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.2.tar.xz.sig
)
sha512sums=(
  2a76fed5f97105b01a057900b451a832b8d1d7d7e9f11bea83daad08433f9dd763e2f15e2efe18cdf607fcd1b9c2d8e5bfbcbf9f1421d6795aa3365804318b72
  9efe7ec75dfad123db3c86b1fab500e2e9446264497495b8fb4fb8fa597066396c2abdfcef79b139e2a4995640dcffe2fc0232a33767362113780df6fc0fbacd
)
md5sums=(
  588d01a5936e80ed7c16d2829026b210
  bd05b7cbf52fd61e8a4c0827711cde1e
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
