# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=paccache-hook
pkgver=1.0.0
pkgrel=1
pkgdesc="A configurable hook to cleanup the pacman package cache using paccache"
arch=('any')
license=('BSD')
depends=('pacman-contrib')
conflicts=('pacman-cleanup-hook')
source=("$pkgname.conf"
		"$pkgname.sh"
		"$pkgname.hook")
sha256sums=('7697d91b064bdb1c19fb78a2c3ec997e76b53c3b0df2cba219738c36e11266f8'
            '21070f4e2069a5f4535482725b27fef84664610126c04260da255ca5d39f1fd3'
            'fdd80cc2ec88445ac9c5fadf2b4053eb0d4864485952a8d9858d6cc3d34c97ce')
backup=("etc/$pkgname.conf")

package() {
  install -D -m644 "${srcdir}/$pkgname.hook" "${pkgdir}/usr/share/libalpm/hooks/$pkgname.hook"
  install -D -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/share/libalpm/scripts/$pkgname.sh"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/$pkgname.conf"
}
