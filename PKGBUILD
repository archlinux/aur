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
md5sums=('cb7fc7aba260062b01a7d7f8a9864d63')
sha512sums=('d61ec5ca885f77e664d6969224e761766d2a8236a6cdb096665b34a80f43c4f6f018c2726fecf78e46022786715482b84ef3fd19e4e526712245f1e3b0049330')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /opt/tutanota-electron-git/tutanota "${pkgdir}/usr/bin/tutanota"
  install -Dm755 "$srcdir/$pkgname/tutanota.desktop" "${pkgdir}/usr/share/applications/tutanota.desktop"
}
