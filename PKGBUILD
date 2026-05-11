# Maintainer: RXTX4816 <RXTX4816@proton.me>

pkgname=cockpit-dockermanager
pkgver=1.0.8
pkgrel=1
pkgdesc="Cockpit application for managing Docker containers"
arch=('any')
url="https://github.com/chrisjbawden/cockpit-dockermanager"
license=('MIT')
depends=('cockpit' 'docker')
makedepends=('git')

source=("git+https://github.com/chrisjbawden/cockpit-dockermanager.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "cockpit-dockermanager"

  install -dm755 "$pkgdir/usr/share/cockpit/dockermanager"
  install -m644 dockermanager/index.html "$pkgdir/usr/share/cockpit/dockermanager/"
  install -m644 dockermanager/app.js "$pkgdir/usr/share/cockpit/dockermanager/"
  install -m644 dockermanager/style.css "$pkgdir/usr/share/cockpit/dockermanager/"
  install -m644 dockermanager/manifest.json "$pkgdir/usr/share/cockpit/dockermanager/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
