# Contributor: Alessio Bianchi <venator85 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=pkgdistcache
pkgver=0.5.1
pkgrel=3
pkgdesc='A distributed local-network cache for pacman packages'
arch=('any')
url='http://venator.ath.cx/dw/doku.php?id=linux:pkgdistcache'
license=('GPL')
depends=('avahi' 'python-dbus' 'dbus-glib' 'python-gobject' 'curl' 'python-requests' 'python-pyxdg')
backup=('etc/pkgdistcache.conf')
install="${pkgname}.install"
source=('pkgdistcache-client'
        'pkgdistcache-daemon'
        'pkgdistcache.conf'
        'pkgdistcached.service')
sha256sums=('a84a9e36471090bf584721747baf2b2b49bacf1c32d8759c3d286bbb331a7f60'
            '6443de9081b7cf350cc261ac9d761bcdf17d01218f762ab85d747ea7eaf90a1d'
            '25106b1e2ed50d04a684f4d356f3d5a34c815fe77af486c863a292dc7643105f'
            '40cb9b08b94960c28423d17447aca8635e6b4038172b6b9a0da6f438e1bcefac')

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
