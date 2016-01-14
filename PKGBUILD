#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.1.14.2
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.2.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.2.tar.xz.sig
)
sha512sums=(
  87a5ba60619545951bfeb23f9f81c75cdc29a087937c965629b22a1ccaf0af0f3a14eaad7cbb7bbd84d455807365884c246158da50d06b6073ba41a1213424dd
  a502ae80046fa5cddaa1b6fb5b47e21c308deaa4e7b3b97f0cc22bfbda8cea567173e19ec912ed89fce7e05dec4c316a05e154855fc42f7368d98684b293df60
)
md5sums=(
  6b0be611cd5871e1b5cf157385242d08
  6f812274a8737fbf1a8a00c57ff171d0
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
