# Maintainer: Jan Magnus Brevik <janmbrevik at gmail dot com>
# Contributor: Rubén Fdes Moreira <tmp-meteque@openmailbox.com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: MacCyber <jonas.enge at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Antti Hautaniemi <an7oine at me com>

pkgname=acestream-engine-i686
pkgver=3.0.3
pkgrel=1
_ubuntuver=14.04
pkgdesc="ACE Stream engine"
arch=('i686')
url="http://acestream.org/"
license=('unknown')
provides=('acestream-engine')
conflicts=('acestream-engine')
depends=('python2-setuptools' 'python2-xlib' 'python2-m2crypto' 'python2-apsw')
optdepends=('libappindicator-gtk2: GTK+ gui support')
install='acestream-engine.install'

source=("acestream-engine.service"
        "http://dl.acestream.org/ubuntu/14/acestream_${pkgver}_ubuntu_${_ubuntuver}_${CARCH}.tar.gz")
sha256sums=('b9863a9dd3ee6d41d18475f5f539107fe81a573f45ca1cb98013441f955f1af0'
            '06f329915273c3adbc2d7c2c23bbeddd3d244c837d0817acaa8c90bd648b6753')

package() {
  cd "$srcdir/acestream_${pkgver}_ubuntu_${_ubuntuver}_$CARCH"
  install -Dm755 acestreamengine "$pkgdir/usr/bin/acestreamengine"
  install -d "$pkgdir/usr/share/acestream/"
  cp -a data lib "$pkgdir/usr/share/acestream/"
  install -Dm644 "$srcdir/acestream-engine.service" "$pkgdir/usr/lib/systemd/system/acestream-engine.service"
}
