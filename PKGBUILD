#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=cronwhip
pkgver=2021
pkgrel=16
pkgdesc='Run missed cronjobs.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/cronwhip"
depends=(python3 sysvinit-tools)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/cronwhip/src/cronwhip-2021.tar.xz
  https://xyne.dev/projects/cronwhip/src/cronwhip-2021.tar.xz.sig
)
sha512sums=(
  1d3982bdb59530df449c4edab175543c10760beca13f60c3a74272d07968d71accbffebd7f2e554915985bd6549a10cb3ed4767f5a1b9c5f310d47ebbede0ce5
  ae00e6c2cf61589331c94a6b6822c937bcec3384077274a03b508eeba8d30314e950b6f29f2ebac5da58142ebc4b4826141049b250ff1b07d22d61a9a4199b31
)
md5sums=(
  3bf8cf17a8c09a599432ced474cb9b29
  5e468b755a85f32e093ab46fd3a02bde
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 cronwhip "${pkgdir}/usr/bin/cronwhip"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim: set ts=2 sw=2 et:
