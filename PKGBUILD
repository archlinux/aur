#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.5
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.5.tar.xz.sig
)
sha512sums=(
  cfeb38f0292e2fd4ce0eacec41fae9f11d054452ccba63c67349f75aec3e3a64741cac86b2b7496690721babc6caeb77c198cd28d5ac723b6505862d2f6f97c2
  d424295984b2913e473e9e3825e88eac0a530e7366e93ae48d3e542d3ab88afcfc34018338fef836ab019bda64bd0307ed232450f7591648ec06b5c557059285
)
md5sums=(
  afb88e1f6a7cb3b192c535bc0a50b93e
  c7890ef34364b3221afe7bb052a42d2c
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
