#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.8
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.8.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.8.tar.xz.sig
)
sha512sums=(
  40261b293df13827733bfaa6e60957de25119162461c5154e903bf9a70265fa5e4794c2cdc08326c37cc33e12283f382a199e08cb97f834161c8d6fc71fc6127
  8e49dd6e4eef80705d85820fadf07081871c0557946c2736c739991f647a1cf215050bbffdf0fc6a02f8d3ce314c3ea2846cebff1ad2295a6aa77bf398112b1c
)
md5sums=(
  efb4bf704a1a7a67cea8706ccace8d68
  484e8a735f6faa5193441109d49d2e46
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
