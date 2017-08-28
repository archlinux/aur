# Maintainer: Markus Zoppelt <markus [at] zoppelt [dot] net>

pkgname=kayak-git
pkgver=$pkgcom.$pkgsha
pkgrel=1
pkgdesc="Kayak is a CAN bus analysis tool based on SocketCAN"
arch=('any')
url="https://github.com/dschanoeh/Kayak"
license=('LGPL-3.0')
depends=('maven')
makedepends=('maven' 'jdk8-openjdk')
provides=('kayak')
conflicts=('kayak')
source=("git://github.com/dschanoeh/Kayak.git")
md5sums=('SKIP')

build() {
    # Use a temporary local maven repository.
  local mvn_repo="$srcdir/mvn-repository"

  cd "${srcdir}/Kayak"
  echo "Building kayak ..."
  mvn clean package -Dmaven.repo.local="$mvn_repo" 
}

package() {
  echo done
}
