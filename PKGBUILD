#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2021.11.20
pkgrel=2
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/bauerbill"
depends=('pacman>=5.2.0' pbget pm2ml powerpill python-pyxdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.11.20.tar.xz
  https://xyne.dev/projects/bauerbill/src/bauerbill-2021.11.20.tar.xz.sig
)
sha512sums=(
  d400081b7162c662dfae1faae49aab2cd00b77da3ef19b6568ff494edef4b9d234bd304b310918c33a2dcf69b5699d8d13cd1e7ccb835bf4d822794d24d00038
  fde45c1e81590c790052a178ee6c5768de935ca4b2e6f38c3ecdd4fac936eec4fb689806d731dc10a940ce540974c4cf764d49e70ed8ddade8a9b9cc82402fd5
)
md5sums=(
  0ce8433596b65e925d2e2f0769240a08
  f5be55d22a8298150c6dac7be9d57292
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
