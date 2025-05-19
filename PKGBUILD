# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tyler Veness <calcmogul at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Thanh Ha <thanh.ha at alumni.carleton dot ca>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dot com>

pkgname=gerrit
pkgver=3.12.0
pkgrel=1
pkgdesc='Web-based code review tool built on top of Git'
arch=('any')
url="https://gerritcodereview.com/"
license=('Apache-2.0')
depends=('java-runtime-headless>=21' 'libcups')
optdepends=('bcprov: Java cryptography APIs (Bouncy Castle)')
backup=('etc/default/gerritcodereview')
install=gerrit.install
source=(
  "https://gerrit-releases.storage.googleapis.com/gerrit-$pkgver.war"
  'gerrit.conf'
  'gerrit.sh'
  'gerrit.service'
  'gerrit.sysusers'
)
sha256sums=('ff540a5aed4e17ab8f92e05c9c7068551aa2888c6becb3e4adf407a633bdb33e'
            '35becf2754e3779c750b2889909349160c2b0584ec201f6cfb5cf2c42e6fc598'
            '21a61acae9f30c6918754f5e81b95b19e3d27c15a3f5f194bf9f468f08726ff8'
            'f69605bc325622bfc3e6e97ab076c253b7c3a3c415ffb4ac52b973041bf5b094'
            '9f1dcfa057da72a8b4928f274920baedb2e9c4d1b3c08270720646e46a1799c6')

package() {
  install -Dvm644 "$pkgname-$pkgver.war" "$pkgdir/usr/share/java/$pkgname/$pkgname.war"
  install -Dvm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dvm644 "$pkgname.conf" "$pkgdir/etc/default/gerritcodereview"
  install -Dvm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dvm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
