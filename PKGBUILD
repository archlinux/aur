#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.1.14.3
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.3.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.3.tar.xz.sig
)
sha512sums=(
  de49b337effe139e57cd42866917ec9a0d3eb786f559df32bd56b31a4183ee9576d881352346b4ff0785ff0f1d24e0041057966828fc493b3f0fede0e2636bfb
  63139312b5a898b32fc29d417a6a6dfc5eae50a2a4afffefd75be2c60e0742e0fcc469626d2ea8a2f71c110f53c0d815d36114ac194fffa0066e4566617427fc
)
md5sums=(
  580a140f57003d8195a58ae733a7935e
  632262db3aa7bcbef2ab3115deb585b3
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
