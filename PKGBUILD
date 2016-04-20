#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.4.19
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.4.19.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.4.19.tar.xz.sig
)
sha512sums=(
  84d90ffc176a4e8ec42e6f0d39853e04ef93a0ea122fe109076d54afcbbc4755cd239c67dc0d9502cd97bc720040589f11dbbeb6146595de57d5040792ba38d0
  1242f06c3be38e2a9f8b512381e657d206ae9895fb30a51d99a2586597ac666925baac99b55b26aaa4bef1f87c26351d69e72d4f75219a364175be527b6cb63a
)
md5sums=(
  a25525f9c67e1a1a6fe1ddb965b6ceed
  212cbd93575f171a32683c3c865546a0
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
