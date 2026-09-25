# Maintainer: Evert Vorster <evorster at gmail dot com>
pkgname=pi-ext-mempalace
pkgver=0.2.0
pkgrel=1
pkgdesc='MemPalace durable memory extension for pi coding agent — structured memories, knowledge graph, session hooks, and cross-wing navigation'
arch=('any')
url='https://github.com/evertvorster/pi-ext-mempalace'
license=('MIT')
depends=('pi-coding-agent' 'python' 'python-mempalace')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evertvorster/pi-ext-mempalace/archive/v${pkgver}.tar.gz")
sha256sums=('7906ec9d80009b037c1b3d6481e01ccaccdfca6e4e814926a1471b1393056a02')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/mempalace"
  cp -a "${srcdir}/pi-ext-mempalace-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/mempalace/"

  # The tarball carries lockfile/dev files that package.json's "files" list does
  # not publish. Drop them so the install tree matches the declared file set.
  rm -f "${pkgdir}/usr/share/pi/extensions/mempalace/.gitignore"
  rm -f "${pkgdir}/usr/share/pi/extensions/mempalace/package-lock.json"

  install -Dm644 "${srcdir}/pi-ext-mempalace-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
