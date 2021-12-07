#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2021.12
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/bauerbill"
depends=('pacman>=5.2.0' pbget pm2ml powerpill python-pyxdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.12.tar.xz
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.12.tar.xz.sig
)
sha512sums=(
  9bb1e57b41b265001ec1058c8007e7077e8e9c0597571bc3d92530e82f7ee66dcb59b27ac7850a940422d185a834d5f706b603c3f1a54cab7ee770977ad0e0f3
  b10df2c18d3c621d4ba62002a0fe6e1b239af1428a381fa9900b2215c28e428393121e39fe43c907ed4991ff876057543be1deb17b0c91fe91a93c0f6b733a93
)
md5sums=(
  73a9a14942d9383ae3cf8efa7852802c
  61de103ab5c2ae983f66cb1369cc96e1
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
