# Original Maintainer: bko <aur at bil dot co dot ua>
# Maintainer: higorslva <higor.slva at outlook dot com>

pkgname=pgadmin4-server-bin
pkgver=9.8
pkgrel=2
pkgdesc='The core server package for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.'
arch=('x86_64')
license=('PostgreSQL')
url='https://www.pgadmin.org/'
depends=('postgresql-libs' 'krb5' 'python-dbus')
provides=('pgadmin4-server')
conflicts=('pgadmin4-server')
source=("pgadmin4-server-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/plucky/dists/pgadmin4/main/binary-amd64/pgadmin4-server_${pkgver}_amd64.deb")
sha256sums=('7cd21f185f7c5790edd9214ddf03389244e56c98afafd2d6db0c8096ae508a1c')

package() {
  # Extract package data
  tar -x --zstd -f data.tar.zst -C "${pkgdir}"
  sed -i "s|ALLOW_SAVE_TUNNEL_PASSWORD = False|ALLOW_SAVE_TUNNEL_PASSWORD = True|" "${pkgdir}/usr/pgadmin4/web/config.py"
}
