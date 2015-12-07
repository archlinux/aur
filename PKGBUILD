#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.7
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.7.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.7.tar.xz.sig
)
sha512sums=(
  8fe1f3009dd843d6dc9ebdd1cf0ac8f06a57d37a90d3b689bc93240680057e6f8fe0fef6dd4c8bdd0cace4f97bb30233dc6bcdbc97e94deb1a2a361e10638854
  244cecbbb07fd78b3f4e55b066f2b8192f830ad11839b6eebd2c11e3fd868a230d137614f79e0848eaa6ae7f1200b146babd9338821e6a136b96a871dda2ccf2
)
md5sums=(
  2e69615c43d0449e48add8f05f71807c
  f9f48f52a9b8fda28ed3664374390b7e
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
