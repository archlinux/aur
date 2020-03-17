# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipt-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='A modern feature flag solution'
arch=('x86_64')
url="https://flipt.io"
license=('GPL3')
provides=('flipt')
source=("https://github.com/markphelps/flipt/releases/download/v${pkgver}/flipt_${pkgver}_linux_x86_64.tar.gz")
md5sums=('deebafd785183186f271c56fa2136818')

package() {
  cd "${srcdir}"
  install -Dm755 flipt "${pkgdir}/usr/bin/flipt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/flipt/LICENSE"
  install -Dm644 config/migrations/sqlite3/* -t "${pkgdir}/usr/share/flipt/migrations/sqlite3/"
  install -Dm644 config/migrations/postgres/* -t "${pkgdir}/usr/share/flipt/migrations/postgres/"
  install -Dm644 config/default.yml "${pkgdir}/etc/conf.d/flipt.yml"
}
# vim:set ts=2 sw=2 et: