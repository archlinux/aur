# Contributor: Alessio Bianchi <venator85 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=pkgdistcache
pkgver=0.3.1
pkgrel=4
pkgdesc='A distributed local-network cache for pacman packages'
arch=('any')
url='http://venator.ath.cx/dw/doku.php?id=linux:pkgdistcache'
license=('GPL')
depends=('avahi' 'python2-dbus' 'python2-gobject2' 'curl')
install="${pkgname}.install"
source=('pkgdistcache-client'
        'pkgdistcache-daemon'
        'pkgdistcache.conf'
        'pkgdistcached.service')
sha256sums=('d53ba7417b6d6db3c36876f7ef92933553ce27597b94ce727deeef8c6edac1f8'
            '812075ee7b50f576d9706e0f9aab48ccfb2ee1fd8c06d91476c90c0fe7d576d8'
            'd77ac418aa651bc622cd91204d6907554c6cdb4bb989e484cc54da32342faa51'
            '5eb96f9e4bcec466d097ac46d72fd9626fb36bd61a3d3ceb1ca69706036f27c2')

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
