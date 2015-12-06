#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.6.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.6.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.6.1.tar.xz.sig
)
sha512sums=(
  283f9a30cae6df7e1290c7190d9229bcce6688d48545ea51eea203668447b40b31ef76154e177f0847093840cc5f12d6c99e0da8dd1e6c6b04a6b65616419f6f
  fc01feb9da23d419d716b8463a5ac087cf74bb3bca7f02955fe05406e87f8f13c8825dfd3871c0539d5653c11835fa32bb07b74758daae1db75a56d3eeb618af
)
md5sums=(
  53f72eb1d3eb8177eb94d91e12c029e9
  46af8fc6ca719fe2ed4d764b4a674be5
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
