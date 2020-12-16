#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2020
pkgrel=2
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/bauerbill"
depends=('pacman>=5.2.0' pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2020.tar.xz
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2020.tar.xz.sig
)
sha512sums=(
  23cab2bb7953cec46b3e599e43d36221fabfd0c423882d7e95412422aa5184f230e80528e9d825f50fb7a86c5bb6d057b9101c9a1c70547dcdafc4b606316554
  2e150190fc568342936d7ecbc4b2115dbd183803cc67a6059950e407493539cc40e5e749906d26aa4cefe412d739df5a07b5d15da42692c42a0d1c574bfcf9f1
)
md5sums=(
  45bdf1af372a3a52d5afb6d293a57320
  c4a802f4295792db7b5a19b9a73b77e5
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 "bauerbill.json" "$pkgdir/etc/bauerbill/bauerbill.json"
  install -Dm644 "man/bauerbill.json.1.gz" "$pkgdir/usr/share/man/man1/bauerbill.json.1.gz"
  install -Dm644 "bauerbill-bash-completion.sh" "$pkgdir/usr/share/bash-completion/completions/bauerbill"
  install -Dm755 "bb-wrapper" "$pkgdir/usr/bin/bb-wrapper"
  install -Dm755 makepkgx "$pkgdir/usr/bin/makepkgx"
}

# vim: set ts=2 sw=2 et:
