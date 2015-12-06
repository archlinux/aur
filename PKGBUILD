#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.6.3
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.6.3.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.6.3.tar.xz.sig
)
sha512sums=(
  e6de3e3667cd4e22a090df89c1978dc2108ec8975cb4066a319f9602e7b3e54e2c739223eba70b475320a8a18451807014c72ed31b59959055a661ff927a085e
  a6f063db588168d2caf2bbb6594280d3ea8bf959da4431d372fece5b49d430432b6d8dabc9d6f74fed9fdcb4b7b1c9479d58ff5547f959d7b7c78921a12fc2ad
)
md5sums=(
  b4ae4f2b0bd8b12535db9a2070cc3d6d
  0e61abeee66b69ce303f2c35fca17499
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
