# Maintainer: <Fominykh Danila dancheg97@fmnx.su>

pkgname="flutter-git-clone"
pkgdesc="UI framework for crossplatform development (git version)"
license=("MIT")
pkgver="1.1"
pkgrel="1"
arch=("x86_64")
url="https://github.com/flutter/flutter"
makedepends=("git")
depends=("unzip")
source=("flutter::git+https://github.com/flutter/flutter")
sha256sums=("SKIP")

package() {
  find . -type f -exec install -Dm777 {} $pkgdir/usr/share/{} \; 
  rm -rf flutter
  install -Dm755 ../flutter.sh $pkgdir/usr/bin/flutter
}

post_install() {
  git config --global --add safe.directory /usr/share/flutter
  sudo chmod a+rwx -R /usr/share/flutter
}
