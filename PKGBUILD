# Maintainer: Leonidas Spyropoulos <artafinde @ archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.1.44
pkgrel=1
epoch=1
groups=(cachyos)
arch=('any')
url="https://github.com/CachyOS/${_gitname}"
license=(GPL-3.0-only)
pkgdesc='CachyOS - ananicy-rules'
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ef9deed0487eb7042445876094556d8714390b9fab89966c1574db3b3442c359')
replaces=(ananicy-rules-git)

package() {
  cd "${_gitname}-${pkgver}"
  install -d "$pkgdir/etc/ananicy.d"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -rf "$srcdir/$_gitname-$pkgver/"* "$pkgdir/etc/ananicy.d"
  rm -f "$pkgdir/etc/ananicy.d"/{LICENSE,README.md,sort-games.sh}
}
