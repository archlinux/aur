#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2021.12.31
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/bauerbill"
depends=('pacman>=5.2.0' pbget pm2ml powerpill python-pyxdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.12.31.tar.xz
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.12.31.tar.xz.sig
)
sha512sums=(
  8c781cb1e78326f900928205fd10a4512402c648e3188c927dd4a354f11f38e13e6f1d53fd0fd57ce46e46f32fa7fc70333666b3ef7d57ca1eae5554c17ceb45
  ebda63eef8778178e1ef2217c3dff472308838c3f9f5c9456627b860c0ded6406175485440bbf60cf20724dfed75d24455a2173995dd8454c03bebbdc99022e5
)
md5sums=(
  0d6bbf2f8c1e6c07630c553e9951a7a1
  97903bf699dc8be0d80a463c5e56a559
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
