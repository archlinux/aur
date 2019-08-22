# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ansible-bundler
pkgver=1.1.0
pkgrel=1
pkgdesc="Bundles Ansible playbooks and dependancies into a single binary."
arch=('any')
url="https://github.com/kriansa/ansible-bundler"
license=('BSD')
depends=('ansible')
source=("https://github.com/kriansa/ansible-bundler/archive/v${pkgver}.tar.gz")
sha256sums=('a6e52b3cfa12a59defcb7ba5aed0709bb131c534a43c3a25106855f8b056748e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r build/pkg/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
