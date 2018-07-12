# Maintainer: Ryan Marcus <ryan@ryanmarc.us>
pkgname=gitea-bin
pkgver=1.5.0
pkgrel=2
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
source=(gitea-1.5-linux-amd64.xz::https://dl.gitea.io/gitea/1.5/gitea-1.5-linux-amd64.xz
        gitea.service)
noextract=()
md5sums=('dd7eee0a074a7954e1369110c7c9f0ee'
         '3d743a44b87004307370ca0c2aa8b02f')

package() {
  install -d "${pkgdir}/etc/gitea"
  install -d ${pkgdir}/var/lib/gitea/{custom,data,indexers,public,log}
  install -d "${pkgdir}/usr/bin"
  install "${srcdir}/gitea-1.5-linux-amd64" "${pkgdir}/usr/bin/gitea"
  install -d "${pkgdir}/etc/systemd/system"
  install "${srcdir}/gitea.service" "${pkgdir}/etc/systemd/system/gitea.service"
}
