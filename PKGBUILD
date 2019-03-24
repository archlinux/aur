# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=paccache-hook
pkgver=1.1.0
pkgrel=1
pkgdesc="A configurable hook to cleanup the pacman package cache using paccache"
arch=('any')
license=('BSD')
depends=('pacman-contrib')
conflicts=('pacman-cleanup-hook')
source=("$pkgname.conf"
		"$pkgname.sh"
		"$pkgname.hook")
sha256sums=('0aba81744ed33eae4fbb135da75d905baab46362f0230e7c7a833c4e8734ccfc'
            '2a4b997c371956d2a03d1ba8ae5b54fc403e354231b6c6798ae7b0d18d06cdee'
            'fdd80cc2ec88445ac9c5fadf2b4053eb0d4864485952a8d9858d6cc3d34c97ce')
backup=("etc/$pkgname.conf")

package() {
  install -D -m644 "${srcdir}/$pkgname.hook" "${pkgdir}/usr/share/libalpm/hooks/$pkgname.hook"
  install -D -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/share/libalpm/scripts/$pkgname.sh"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/$pkgname.conf"
}
