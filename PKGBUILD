# Maintainer: Pieter Joost van de Sande <pj@born2code.net>

pkgname=naivecalendar-git
_pkgname=("naivecalendar")
provides=("naivecalendar.py")
conflicts=("naivecalendar.py")
pkgdesc="A rofi calendar popup"
url="https://framagit.org/Daguhh/naivecalendar"
pkgver=20201124.925b187
pkgrel=1
arch=("any")
depends=("python>=3")
makedepends=("git")
source=("git+https://framagit.org/Daguhh/naivecalendar.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package()
{
  chmod +x "${srcdir}/${_pkgname}/naivecalendar.py"
  install -Dm755 "${srcdir}/${_pkgname}/naivecalendar.py" "${pkgdir}/usr/bin/${_pkgname}"
}
