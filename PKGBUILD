
# Maintainer: Your Name <youremail@domain.com>

pkgname=iris-wall-git
pkgver=0.2.0.r1.g807a60b
pkgrel=1
pkgdesc="A highly configurable wallpaper manager with awesome features and lightweight behaviour"
arch=(x86_64 i686)
url="https://github.com/Shravan-1908/iris.git"
license=(MIT)
makedepends=(git go)
source=("iris::git+https://github.com/Shravan-1908/iris.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/iris"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  wget -O irise https://github.com/Shravan-1908/iris/releases/latest/download/iris-linux-amd64
  chmod +x irise
  sudo mv irise /usr/bin/iris
}

check() {
  cd "${srcdir}/iris"
}

package() {
  cd "${srcdir}/iris"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
