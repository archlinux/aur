# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=1.0rc4
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
sha256sums=('fc363a4bac73ae5177488a51d7f8c4b75cb2b184b95063265b5952245b28e5e1')

package() {
  _instdir="$pkgdir"/usr/share/webapps/flyspray
  mkdir -p ${_instdir} "$pkgdir"/etc/webapps/flyspray
  cd ${_instdir}
  cp -ra "$srcdir"/flyspray-${pkgver/rc/-rc}/* .
  echo "deny from all" > "$pkgdir"/etc/webapps/flyspray/.htaccess
  ln -s /etc/webapps/flyspray/.htaccess .htaccess
}
