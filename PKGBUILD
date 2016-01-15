#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.1.14.4
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.4.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.1.14.4.tar.xz.sig
)
sha512sums=(
  a0a053d5571c90f8482f036a7d31ccb75448828826fdd588d19e44149239765fc916776e8cc5f61df619d215c72c414fc31675ea5b9b01e14171ff699fe02bee
  f1593484937e2b0cdf3ffb58f855b134ca5a8591bb64d720b9c2bf1672a4365510297fafaf76103eaf7655517586d6eb72f8b1dabe945c7f140eba62d184f655
)
md5sums=(
  079907e4eb0ee033c629f88895f3b4fc
  c43f9f1b22cd6082f9e522022f1d5df4
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
