# Contributor: Alessio Bianchi <venator85 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=pkgdistcache
pkgver=0.4.6
pkgrel=3
pkgdesc='A distributed local-network cache for pacman packages'
arch=('any')
url='http://venator.ath.cx/dw/doku.php?id=linux:pkgdistcache'
license=('GPL')
depends=('avahi' 'python-dbus' 'dbus-glib' 'python-gobject' 'curl' 'python-requests' 'python-xdg')
install="${pkgname}.install"
source=('pkgdistcache-client'
        'pkgdistcache-daemon'
        'pkgdistcache.conf'
        'pkgdistcached.service')
sha256sums=('4141d8d07a7c67ebd0dba24ca8aa2a97bcf93a2915b7afbebbd85728bbbc356c'
            '10379b95265e7aa3c6334197ef255327281e35b958c3c062ae893dd3a646a66e'
            'd77ac418aa651bc622cd91204d6907554c6cdb4bb989e484cc54da32342faa51'
            'b5fb3b3d40b31af92a1676364dfc42a35f564067988697ea4d56fd71b4b414e3')

package() {
  install -d "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/pkgdistcache-client" "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/lib/$pkgname/"
  install -m755 "${srcdir}/pkgdistcache-daemon" "${pkgdir}/usr/lib/$pkgname/"
  install -d "${pkgdir}/etc/"
  install -m644 "${srcdir}/pkgdistcache.conf" "${pkgdir}/etc/"
  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -m644 "${srcdir}/pkgdistcached.service" \
      "${pkgdir}/usr/lib/systemd/system/"
}
