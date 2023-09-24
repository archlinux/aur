# Maintainer: DaniD3v <nichtdu.login@gmail.com>

pkgname="akkufetch-git"
pkgdesc="Neofetch for laptop batteries"
url="https://github.com/mrHeavenli/akkufetch"

pkgver=20230924
pkgrel=3

license=("GPL3")
depends=("python-dbus" "upower" "python")
makedepends=("git")

source=("git+https://github.com/mrHeavenli/akkufetch.git")
sha256sums=("SKIP")
arch=("any")

pkgver() {
  cd "${srcdir}/akkufetch"
  git log -1 --format=%cd --date=short | tr -d '-'
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  mkdir "${pkgdir}/usr/bin"

  chmod +x "${srcdir}/akkufetch/src/main.py"
  cp -R "${srcdir}/akkufetch" "${pkgdir}/usr/share"
  ln -s "/usr/share/akkufetch/src/main.py" "${pkgdir}/usr/bin/akkufetch"
}
