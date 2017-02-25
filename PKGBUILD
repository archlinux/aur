# Contributor: Alessio Bianchi <venator85 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=pkgdistcache
pkgver=0.3.2
pkgrel=4
pkgdesc='A distributed local-network cache for pacman packages'
arch=('any')
url='http://venator.ath.cx/dw/doku.php?id=linux:pkgdistcache'
license=('GPL')
depends=('avahi' 'python2-dbus' 'dbus-glib' 'python2-gobject2' 'curl')
install="${pkgname}.install"
source=('pkgdistcache-client'
        'pkgdistcache-daemon'
        'pkgdistcache.conf'
        'pkgdistcached.service')
sha256sums=('d53ba7417b6d6db3c36876f7ef92933553ce27597b94ce727deeef8c6edac1f8'
            'b0e40b5d51b34c7613ce28656e450ecaf664d5ec8fc5d1c5179dd0a4d9f19881'
            'd77ac418aa651bc622cd91204d6907554c6cdb4bb989e484cc54da32342faa51'
            'fdfa58e652230725a232de41c87627ed8c9a4fd9d081c8a3d261ea75cf91a81a')

package() {
  install -d "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/pkgdistcache-client" "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/pkgdistcache-daemon" "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/etc/"
  install -m644 "${srcdir}/pkgdistcache.conf" "${pkgdir}/etc/"
  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -m644 "${srcdir}/pkgdistcached.service" \
      "${pkgdir}/usr/lib/systemd/system/"
}
