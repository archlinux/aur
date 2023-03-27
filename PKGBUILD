# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tyler Veness <calcmogul at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Thanh Ha <thanh.ha at alumni.carleton dot ca>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dot com>

pkgname=gerrit
pkgver=3.7.2
pkgrel=1
pkgdesc="Web-based code review tool built on top of Git"
arch=('any')
url="https://gerritcodereview.com/"
license=('Apache')
depends=('java-runtime>=11' 'java-runtime<13' 'libcups')
optdepends=('bcprov: Java cryptography APIs (Bouncy Castle)')
backup=('etc/default/gerritcodereview')
install=gerrit.install
source=(
  "https://gerrit-releases.storage.googleapis.com/gerrit-$pkgver.war"
  'gerrit.conf'
  'gerrit.service'
  'gerrit.sysusers'
  'gerrit.tmpfiles')
sha256sums=('5c1e5ba6562989ddafc528e6d4308662c77777991493c3e59e115d0803915fa9'
            '35becf2754e3779c750b2889909349160c2b0584ec201f6cfb5cf2c42e6fc598'
            'fa21680907eb149707dd12b4637dd1b5c93cc019799fd61efd54d87f81b35f03'
            '9f1dcfa057da72a8b4928f274920baedb2e9c4d1b3c08270720646e46a1799c6'
            '4cfbff3c34c8ca67482450a206e91319b2ebef3ccde77d5269ee169232109f8a')

package() {
  install -Dvm644 "$pkgname-$pkgver.war" "$pkgdir/usr/share/java/$pkgname/$pkgname.war"
  install -Dvm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dvm644 "$pkgname.conf" "$pkgdir/etc/default/gerritcodereview"
  install -Dvm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dvm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
