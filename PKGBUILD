#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=cronwhip
pkgver=2021
pkgrel=3
pkgdesc='Run missed cronjobs.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/cronwhip"
depends=(python3 sysvinit-tools)
source=(
  https://xyne.dev/projects/cronwhip/src/cronwhip-2021.tar.xz
  https://xyne.dev/projects/cronwhip/src/cronwhip-2021.tar.xz.sig
)
sha512sums=(
  1d3982bdb59530df449c4edab175543c10760beca13f60c3a74272d07968d71accbffebd7f2e554915985bd6549a10cb3ed4767f5a1b9c5f310d47ebbede0ce5
  2f1b1b699aa9b3042e2e3341137f019a2d667940c49cbfe6187ee4cbcd4562e117c67db08acc7b6aa1ecb589f8299063cc4afe1cfda070548d6f96ce0a546ff4
)
md5sums=(
  3bf8cf17a8c09a599432ced474cb9b29
  eaf616bed116dd91994d7d21233e8ba3
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 cronwhip "${pkgdir}/usr/bin/cronwhip"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim: set ts=2 sw=2 et:
