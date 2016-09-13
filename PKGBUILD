# Maintainer: Luigi Guevara <@killua99>

pkgname=my-weather-indicator
pkgver=r30.b8fb5fb
pkgrel=1
pkgdesc='A simple indicator for the weather'
arch=('i686' 'x86_64')
url='https://launchpad.net/my-weather-indicator'
license=('GPL3')
depends=('gtk3' 'glib2' 'libnotify' 'webkitgtk' 'geocode-glib' 'python-pytz'
         'python-cairo' 'python-lxml' 'python-dateutil'
         'python2-requests-oauthlib' 'geoclue2' 'geoip')
makedepends=('git' 'libappindicator-gtk3')
provides=('my-weather-indicator')
conflicts=('my-weather-indicator')
install='my-weather-indicator.install'
source=('git+https://git.launchpad.net/my-weather-indicator')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname

  install -D -m644 "${pkgdir}/opt/${$pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
