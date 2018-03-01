# Contributor: Alessio Bianchi <venator85 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=pkgdistcache
pkgver=0.5.0
pkgrel=2
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
sha256sums=('bef0809d86e151a4551a122b29f4c90d2f06ab34459a8ff91a37a29a6fd2a3f7'
            '10379b95265e7aa3c6334197ef255327281e35b958c3c062ae893dd3a646a66e'
            '5628cf4d81adaf7a3dd7243f51af1a30fff73a31b421615a7c0051280618f457'
            'b98bccb089bc0025b0f9b4b949b691e5564b0e40778a263a5bb6ffa5f01d04a2')

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
