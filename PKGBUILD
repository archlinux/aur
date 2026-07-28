# Maintainer: Leonidas Spyropoulos <artafinde @ archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.1.47
pkgrel=1
epoch=1
groups=(cachyos)
arch=('any')
url="https://github.com/CachyOS/${_gitname}"
license=(GPL-3.0-only)
pkgdesc='CachyOS - ananicy-rules'
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08d679dced6062b663c3aa134d2298a8fa274fe3f480fb04c2bd6f0f212d5bcb')
replaces=(ananicy-rules-git)

package() {
  cd "${_gitname}-${pkgver}"
  install -d "$pkgdir/etc/ananicy.d"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -rf "$srcdir/$_gitname-$pkgver/"* "$pkgdir/etc/ananicy.d"
  rm -f "$pkgdir/etc/ananicy.d"/{LICENSE,README.md,sort-games.sh}
}
