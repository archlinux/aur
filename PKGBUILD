# Maintainer: Lauri Kenttä <lauri.kentta@gmail.com>
pkgname=huawei-mobile-helper
pkgver=1.0
pkgrel=1
pkgdesc="Auto-connect for non-HiLink Huawei USB dongles"
arch=('any')
url="https://github.com/Metabolix/$pkgname"
license=('GPL')
depends=('udev' 'systemd' 'bash')
source=("git+$url.git")
sha1sums=(${source[@]/*/SKIP})

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  sh install.sh "$pkgdir"
}
