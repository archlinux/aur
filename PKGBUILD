# Maintainer: Can <your-email@example.com>
pkgname=biglinux-webapps-git
pkgver=r100.g1234567
pkgrel=1
pkgdesc="BigLinux WebApps - Web applications manager with automatic icon fetching"
arch=('any')
url="https://github.com/biglinux/biglinux-webapps"
license=('GPL3')
depends=('bash' 'python' 'python-pyqt5' 'kio')
makedepends=('git')
provides=('biglinux-webapps')
conflicts=('biglinux-webapps')
source=("git+https://github.com/biglinux/biglinux-webapps.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/biglinux-webapps"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/biglinux-webapps"

  if [ -d "usr" ]; then
    cp -r usr/ "$pkgdir/"
  fi
}
