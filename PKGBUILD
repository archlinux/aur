# Maintainer: Leonidas Spyropoulos <artafinde @ archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.1.49
pkgrel=1
epoch=1
groups=(cachyos)
arch=('any')
url="https://github.com/CachyOS/${_gitname}"
license=(GPL-3.0-only)
pkgdesc='CachyOS - ananicy-rules'
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91da2ae358f1f83e4a3e3b9b42abacf235be75f347a9b1ede1b3dd67a2dae5a6')
replaces=(ananicy-rules-git)

package() {
  cd "${_gitname}-${pkgver}"
  install -d "$pkgdir/etc/ananicy.d"
  cp -Rt "$pkgdir/etc/ananicy.d/" *.cgroups *.types ananicy.conf 00-default
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
