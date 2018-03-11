# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=mozilla-firefox-sync-server
pkgver=1.7.0
pkgrel=4
pkgdesc="Mozilla Sync Server for built-in Firefox Sync"
arch=('any')
url='http://docs.services.mozilla.com/howtos/run-sync-1.5.html'
license=('GPL')
depends=('python2' 'python2-pyramid' 'python2-mozsvc' 'python2-konfig' 'python2-configparser' 'python2-tokenserver'
         'python2-simplejson' 'python2-paste-deploy' 'python2-syncstorage' 'python2-pyramid-hawkauth' 'python2-tokenlib' 'python2-sqlalchemy')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla-services/syncserver/archive/v${pkgver}.tar.gz")
sha512sums=('c66aed1195138f15729ed7ef3fb31837bd74f751c0df4f93d0d6c3a8b34687d7dc02e201cfb6c218aab1d769698950ea316f688b51d90b87e8c495d573b85cc3')
backup=('usr/share/webapps/mozilla-firefox-sync-server/syncserver.ini')

package() {
  cd "syncserver-${pkgver}"
  python2 setup.py install --root "${pkgdir}"
  install -dm 755 "${pkgdir}/usr/share/webapps/mozilla-firefox-sync-server"
  cp syncserver.ini syncserver.wsgi "${pkgdir}/usr/share/webapps/mozilla-firefox-sync-server/"
}

# vim: ft=sh syn=sh  ts=2 sw=2 et:
