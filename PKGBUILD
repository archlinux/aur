#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.4.2
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(python3 powerpill python3-xcpf python3-aur pm2ml pbget)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.2.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.4.2.tar.xz.sig
)
sha512sums=(
  713b631632b7c2e05bde4be1392c5486d7feffbf2bba4daeaf314b56f7665c3dff37fb76a9c81e7c6ae386a3f113e00a886e07313fbaeb0f8128901a06be6288
  a5f8fd81557341091f5b7fac346d81047a0bf7990134517ab0d3fbd2b66edca1052b6514a6af81fd5cca4fecd63e0122cb4a4da3009d614d86c8c248cac27358
)
md5sums=(
  2b5973516b90688dde14b7b201590bc8
  794bcb4a9a7c36a3bbd6df51854b9ec0
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
