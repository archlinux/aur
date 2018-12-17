# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A secure email client"
arch=('x86_64')
url="https://gitlab.com/TheSilentDrifter/Tutanota-Electron"
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
source=("https://gitlab.com/TheSilentDrifter/Tutanota-Electron/raw/master/tutanota-electron-git.tar.xz")
md5sums=('54ba4c185be392644b76e818f12a3c55')
sha512sums=('9eba93361f627508f044b128da012becc062f722ef3b8801a5b34530a85d3f4555d7793d6c7f8826ea3f2935c669f48794c97e0cec8c2c543a57acb808fcea05')

package() {
  mkdir -p "${pkgdir}/opt/$pkgname/"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}/" "${pkgdir}/opt/$pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  ln -s /opt/tutanota-electron-git/tutanota "${pkgdir}/usr/bin/tutanota"
  install -Dm755 "$srcdir/$pkgname/tutanota.desktop" "${pkgdir}/usr/share/applications/tutanota.desktop"
}
