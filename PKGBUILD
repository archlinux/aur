# Maintainer: Finlay Maroney finman292004@protonmail.com
pkgname=finlayscript6
pkgver=1.0
pkgrel=1
pkgdesc="The official FinlayScript6 interpreter"
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
source=("git://github.com/thatmadhacker/FinlayScript6.git")
noextract=()
md5sums=("SKIP")

build() {
  cd "FinlayScript6"

  ./gradlew build
}

package() {
  mkdir -p "../pkg/finlayscript6/usr/lib/FS6/bin"
  mkdir -p "../pkg/finlayscript6/usr/bin"
  cp "FinlayScript6/build/libs/FinlayScript6-all.jar" "../pkg/finlayscript6/usr/lib/FS6/bin/FinlayScript6.jar"
  cp "FinlayScript6/finlayscript6" "../pkg/finlayscript6/usr/bin/"
  cd ../pkg/
  chmod +x "finlayscript6/usr/lib/FS6/bin/FinlayScript6.jar"
  chmod +x "finlayscript6/usr/bin/finlayscript6"
}
