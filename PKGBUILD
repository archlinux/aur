# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.0.2
pkgrel=2
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
source=("https://bitbucket.org/Thesilentdrifter/tutanota-electron/raw/54d8d49756036822d939dabfb157e43066fa0df1/tutanota-electron-git.tar.gz")
md5sums=('19b704db8dfae33c99a38e68d1b918bc')
sha512sums=('6cd87a397467e7a247456ac63ffa25163a15cc19f931be21e4f30f0d77c064838a89e0dd246cb88afe6c5169c4ac34117b4316f26991aed11384978fb6d5df1c')
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
