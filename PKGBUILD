# Maintainer: Ryan Marcus <ryan@ryanmarc.us>
pkgname=gitea-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Git with a cup of tea, binary installation"
arch=('x86_64')
url='https://gitea.io/'
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'pam: Authentication via PAM support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
provides=()
conflicts=('gitea' 'gitea-git')
replaces=()
backup=('etc/gitea/app.ini')
options=()
install=gitea-bin.install
source=(gitea-1.5.1-linux-amd64.xz::https://dl.gitea.io/gitea/1.5.1/gitea-1.5.1-linux-amd64.xz
        gitea.service)
noextract=()
md5sums=('294fb120014698d1e39068ecaebe8746'
         '3d743a44b87004307370ca0c2aa8b02f')

package() {
  install -d "${pkgdir}/etc/gitea"
  install -d ${pkgdir}/var/lib/gitea/{custom,data,indexers,public,log}
  install -d "${pkgdir}/usr/bin"
  install "${srcdir}/gitea-1.5.1-linux-amd64" "${pkgdir}/usr/bin/gitea"
  install -d "${pkgdir}/etc/systemd/system"
  install "${srcdir}/gitea.service" "${pkgdir}/etc/systemd/system/gitea.service"
}
