# Maintainer: Charles Wise <charles at charlesbwise dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sonerezh
pkgver=1.1.3
pkgrel=1
pkgdesc='A self-hosted, web-based application for stream your music, everywhere'
arch=('any')
url='https://www.sonerezh.bzh'
license=('GPL3')
depends=('php' 'php-gd')
optdepends=('mariadb: Database backend'
	    'libav-no-libs: Music transcoding') 
options=('!strip')
source=("https://github.com/Sonerezh/sonerezh/archive/${pkgver}.tar.gz"
        "example_nginx_vhost.conf")
md5sums=('d572cf39336bdfb02e4366c572ee8c82'
         '955712ddb7884cc7343e67109155ed1e')
provides=('sonerezh')
conflicts=('sonerezh-git' 'sonerezh-devel-git')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/webapps/sonerezh"
  cp -r * "${pkgdir}/usr/share/webapps/sonerezh/"

  install -d "${pkgdir}/etc/webapps/sonerezh"

  install -d "${pkgdir}/usr/share/doc/sonerezh"
  install -Dm644 "${srcdir}/example_nginx_vhost.conf" "${pkgdir}/usr/share/doc/sonerezh/"
}
