#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017.3.29.1
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.29.1.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.29.1.tar.xz.sig
)
sha512sums=(
  cb13d15b30c716d88f669a7094d60486ab82e5515e22ebf8ccfd71ed00d9d84197227f35193635a5cacd4c5d3b619bf122772c87cca17b810b99eb12b24495c2
  47443032131734c788e442ea4359081a546844e3cc3dcc3099f007578155bb0b110b63637a64f3f9656186adeb6e94ef7ac8c26fd4286c539a8ac2f6ce58e8a3
)
md5sums=(
  071a8578e2c881334319be8a90821616
  d3492f59518ffc02f227892742419120
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
