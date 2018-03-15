# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.0.2
pkgrel=2
pkgdesc="A secure email client"
arch=('x86_64')
url="https://bitbucket.org/Thesilentdrifter/tutanota-electron"
licence=('BSD')
depends=('gconf' 'gulp-cli' 'npm')
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
source=("https://bitbucket.org/Thesilentdrifter/tutanota-electron/raw/9d6c55637db9cf4349307a146674004d67c0ee5c/tutanota-electron-git.tar.gz")
md5sums=('d4fbf97885f431ca97d5ff9a59b274db')
sha512sums=('6fa9dc14288a623236b8148488b554ef8aa65a300fba3685b9dc02d5904517a50af08edec71957bdbf5939688517f4d7af62c69906523480e3e4a26f458c3209')
build() {
  cd "$pkgname"
  sudo npm install -g electron-packager
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
