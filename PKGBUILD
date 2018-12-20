# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A secure email client"
arch=('x86_64')
url="https://gitlab.com/TheSilentDrifter/Tutanota-Electron"
licence=('BSD')
depends=('gconf')
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
md5sums=('2c117dcb34bd1acb78f04c5b7fcda870')
sha512sums=('a7927bef2fc217e192f798847b4f53d2d8aae9e525f08da5115dd4cef0286d1435e30e47326a56961c0d105d71c3a4f11a5b0961b9651fff1de26d480a7315d7')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /opt/tutanota-electron-git/tutanota "${pkgdir}/usr/bin/tutanota"
  install -Dm755 "$srcdir/$pkgname/tutanota.desktop" "${pkgdir}/usr/share/applications/tutanota.desktop"
}
