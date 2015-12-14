#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.14
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.14.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.14.tar.xz.sig
)
sha512sums=(
  af2e0e99983a7b8418a66d97434545e1bb153a7f9fd1a39d0b86307a19b271d9e03f4296416d835582884b353bab8abfe84f61831c30c8c7041a86f182738eb9
  e8fa0fcca79e61b9c0ec05a483b88a76a25caf7082cc3baf84ecb344148e9d451f0f0b7946073320d31011a0e8f608e2520024ee6e333cda0f0e561f0ec6660c
)
md5sums=(
  a9d790bc99443db145c657d3142e94c9
  124857c58fd2863f67280d5709c04c06
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
