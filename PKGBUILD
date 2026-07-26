# Maintainer: babaynux <your-email@example.com>
pkgname=bigwebapp-manager
_pkgname=biglinux-webapps
pkgver=r100.g1234567
pkgrel=1
pkgdesc="BigLinux WebApps - Web applications manager with automatic icon fetching"
arch=('any')
url="https://github.com/biglinux/biglinux-webapps"
license=('GPL-3.0-or-later')
depends=('bash' 'python' 'python-pyqt5' 'kio')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/biglinux/biglinux-webapps.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  if [ -d "usr" ]; then
    cp -r usr/ "$pkgdir/"
  fi
}
