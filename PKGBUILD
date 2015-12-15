#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.15
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.15.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.15.tar.xz.sig
)
sha512sums=(
  0f5f574d95664bc8cf01c38a8c41ffe7069901ee99e95a5e4b49279c87f974324061b1092399970ffbf2485cbf248c054fb96f6d50e7794c91daaa3697bbc76b
  ee3f4d150debd58f5397ea005d1f536eed3eb6ddcafd4fbc7978ce97a6e2080592fd826daf4fec9c71777727ee542d1113114387d97734fba23ae2e43569ea6a
)
md5sums=(
  96b53fca2d2018c90cf1c226a07752a2
  aa45e99ee9e6eaf007404bcaaddf8bcd
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
