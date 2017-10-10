# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=1.0rc6
pkgrel=1
pkgdesc="A PHP web-based bug tracker"
arch=('any')
url="http://www.flyspray.org/"
license=('GPL')
depends=('php')
makedepends=('unzip')
backup=('etc/webapps/flyspray/.htaccess')
options=('!strip')
noextract=(flyspray-$pkgver.zip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Flyspray/flyspray/archive/v${pkgver/rc/-rc}.tar.gz")
sha256sums=('41d2cb35bc5bdbac8d47d4cf3865775c9f65beb57559cdb79ac59461c7692081')

package() {
  _instdir="$pkgdir"/usr/share/webapps/flyspray
  mkdir -p ${_instdir} "$pkgdir"/etc/webapps/flyspray
  cd ${_instdir}
  cp -ra "$srcdir"/flyspray-${pkgver/rc/-rc}/* .
  echo "deny from all" > "$pkgdir"/etc/webapps/flyspray/.htaccess
  ln -s /etc/webapps/flyspray/.htaccess .htaccess
}
