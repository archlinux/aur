# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tyler Veness <calcmogul at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Thanh Ha <thanh.ha at alumni.carleton dot ca>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dot com>

pkgname=gerrit
pkgver=3.4.1
pkgrel=1
pkgdesc="Web-based code review tool built on top of Git"
arch=('any')
url="https://www.gerritcodereview.com/"
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
sha256sums=('a47a2660a62957ad1220a2e8493e72f62dc5a6b315d551b2fb91a3869461054a'
            '35becf2754e3779c750b2889909349160c2b0584ec201f6cfb5cf2c42e6fc598'
            'fa21680907eb149707dd12b4637dd1b5c93cc019799fd61efd54d87f81b35f03'
            '9f1dcfa057da72a8b4928f274920baedb2e9c4d1b3c08270720646e46a1799c6'
            'cd529d580bf744624bca9bb7b67ce39a7f70e0357f43714699fc0930635f1357')

package() {
  install -Dm 644 "$pkgname-$pkgver.war" "$pkgdir/usr/share/java/$pkgname/$pkgname.war"
  install -Dm 644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm 644 "$pkgname.conf" "$pkgdir/etc/default/gerritcodereview"
  install -Dm 644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
