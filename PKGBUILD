# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname=bindiff
pkgver=6
pkgrel=1
pkgdesc="A comparison tool for binary files that assists vulnerability researchers and engineers to quickly find differences and similarities in disassembled code."
arch=('x86_64')
url="https://www.zynamics.com/bindiff.html"
license=('custom')
depends=('desktop-file-utils' 'java-runtime>=8')
options=('!strip')
install=${pkgname}.install
backup=("etc/opt/${pkgname}/bindiff.xml")
source=("https://storage.googleapis.com/bindiff-releases/bindiff_${pkgver}_amd64.deb"{,.asc})
sha256sums=('f84dacaccfeb7d2ba34cfac711457be7f3a3c963470ed7b639615f9142ffde8d'
            'SKIP')
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')  # Google Inc. (Linux Packages Signing Authority)

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license files
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set et sw=2 sts=2 tw=80:
