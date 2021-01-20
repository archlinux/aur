# Maintainer: Gray <apoco@pm.me>
pkgname=dartbuster
pkgver=1.0.2
pkgrel=1
pkgdesc="URL Fuzzing / brute forcing tool, written in dart."
arch=('any')
url="https://github.com/GrayWasTaken/dartbuster.git"
license=('MIT')
makedepends=('git' 'dart')
changelog=
source=("git+$url")
md5sums=('SKIP') #autofill using updpkgsums

# build() {
#   # mkdir -p "$pkgname"
#   # cd "$pkgname"
#   ls -la
#   pwd
#   pub get
#   dart2native ./bin/dartbuster.dart -o bin/dartbuster
# }

package() {
  cd "$pkgname"
  pub get
  dart2native bin/dartbuster.dart -o bin/dartbuster
  sudo mkdir -p "/opt/$pkgname"
  sudo cp -rf * "/opt/$pkgname"
  sudo ln -sf /opt/dartbuster/bin/dartbuster /bin/dartbuster
}

# todo on uninstall remove binary aswell as /opt/dartbuster