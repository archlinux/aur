# Maintainer: David Runge <dvzrv@archlinux.org>

_name=FST
pkgname=fst
pkgver=0.120.0
pkgrel=1
pkgdesc="Free Studio Technology"
arch=('any')
url="https://git.iem.at/zmoelnig/FST"
license=('GPL3')
source=("https://git.iem.at/zmoelnig/${_name}/-/archive/v${pkgver}/${_name}-v${pkgver}.tar.gz")
sha512sums=('2160c04a33b4345e73720f475f8189a83fb333cd807590bdb9104db081158e12d1a402ab8c6d704d255a4fa6ed2dc47df71b76b0b90caf7802d6847afbe79c6d')
b2sums=('add91ab14ee1ce6385b1b6f4f0e9fb8c7d1fd19f4d799decbb8b78f3cdfc5d5a1f51c65a08282e1439d7e4c899c7ea2a6f5c24231c53623e78dac3e42d3a165c')

prepare() {
  mv -v "${_name}-v$pkgver" "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 fst/*.h -t "${pkgdir}/usr/include/pluginterface/${pkgname}/"
  install -vDm 644 README.md docs/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
