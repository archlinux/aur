# Maintainer: Pieter Joost van de Sande <pj@born2code.net>

pkgname=qutebrowser-profile-git
_pkgname="qutebrowser-profile"
provides=("qutebrowser-profile")
pkgdesc="A simple wrapper script for qutebrowser that allows you to maintain different profiles"
url="https://github.com/jtyers/qutebrowser-profile"
pkgver=20201130.55ff314
pkgrel=1
license=("MIT")
arch=("any")
depends=("bash")
source=("git+https://github.com/jtyers/qutebrowser-profile.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package()
{
  chmod +x "${srcdir}/${_pkgname}/qutebrowser-profile"
  install -Dm755 "${srcdir}/${_pkgname}/qutebrowser-profile"         "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgname}/qutebrowser-profile.desktop" "${pkgdir}/usr/share/applications/qutebrowser-profile.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE"                     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
