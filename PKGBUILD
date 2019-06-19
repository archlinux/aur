# Maintainer: Finlay Maroney finman292004@protonmail.com
pkgname=fspm
pkgver=1.0
pkgrel=1
pkgdesc="The FinlayScript6 Package Manager"
arch=('any')
url=""
license=('MIT')
groups=()
depends=('java-runtime' 'bash')
makedepends=(git)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/thatmadhacker/FSPM.git")
noextract=()
md5sums=("SKIP")

build() {
  cd "FSPM"

  ./gradlew build
}

package() {
  mkdir -p "../pkg/fspm/usr/lib/FS6/bin"
  mkdir -p "../pkg/fspm/usr/bin"
  cp "FSPM/build/libs/FSPM-all.jar" "../pkg/fspm/usr/lib/FS6/bin/FSPM.jar"
  cp "FSPM/fspm" "../pkg/fspm/usr/bin/"
  cd ../pkg/
  chmod +x "fspm/usr/lib/FS6/bin/FSPM.jar"
  chmod +x "fspm/usr/bin/fspm"
}
