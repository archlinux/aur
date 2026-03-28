# Maintainer: Leonidas Spyropoulos <artafinde @ archlinux.org>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.1.32
pkgrel=1
epoch=1
groups=(cachyos)
arch=('any')
url="https://github.com/CachyOS/${_gitname}"
license=(GPL-3.0-only)
pkgdesc='CachyOS - ananicy-rules'
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('935f1c740c097f03d662a1168211f0a874cdff33fdef1e667f1cb1479912c866')
replaces=(ananicy-rules-git)

prepare() {
  cd "${_gitname}-${pkgver}"
  rm -f README.md
}

package() {
  cd "${_gitname}-${pkgver}"
  install -d "$pkgdir/etc/ananicy.d"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -rf "$srcdir/$_gitname-$pkgver/"* "$pkgdir/etc/ananicy.d"
}
