# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=1.0rc7
pkgrel=1
pkgdesc='Lightweight, web-based bug tracking system written in PHP'
url='https://www.flyspray.org/'
arch=('any')
license=('LGPL2.1')
depends=('php')
backup=('etc/webapps/flyspray/.htaccess')
options=('!strip')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Flyspray/flyspray/archive/v${pkgver/rc/-rc}.tar.gz)
sha256sums=('b04c4ff059f9a0449279758d196d7843bc99fad2365c930ed9d06e6b55eee9e2')

package() {
  _instdir="${pkgdir}"/usr/share/webapps/flyspray
  mkdir -p "${_instdir}" "${pkgdir}"/etc/webapps/flyspray
  cd "${_instdir}"
  cp -ra "${srcdir}"/flyspray-${pkgver/rc/-rc}/* .
  echo "deny from all" > "${pkgdir}"/etc/webapps/flyspray/.htaccess
  ln -s /etc/webapps/flyspray/.htaccess .htaccess
}

# vim: ts=2 sw=2 et:
