# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A secure email client"
arch=('x86_64')
url="https://bitbucket.org/Thesilentdrifter/tutanota-electron"
licence=('BSD')
depends=('gulp-cli' 'npm')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changeLog=()
source=("https://bitbucket.org/Thesilentdrifter/tutanota-electron/raw/9a7e8dd0c44f5f43e931a79556512bffe9415431/tutanota-electron-git.tar.gz")
md5sums=(51466202ad0c301f5d3605b7226cfa4b)
sha512sums=(639b841f8a668514bcdac1c4f16a6ae35d5e81a25d1fc09291a0a5b2eb7a6fa9d19346ab8baaeffb5bfbad3c7485d243f9a5b534fe20332375fd3c3b2474b42b)

build() {
  cd "$pkgname"
  ./build.sh
}

package() {
  mkdir -p "${pkgdir}/opt/$pkgname/"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}/releases/tutanota-linux-x64/" "${pkgdir}/opt/$pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  ln -s /opt/tutanota-electron-git/tutanota-linux-x64/tutanota "${pkgdir}/usr/bin/tutanota"
  install -Dm755 "$srcdir/$pkgname/tutanota.desktop" "${pkgdir}/usr/share/applications/tutanota.desktop"
}
