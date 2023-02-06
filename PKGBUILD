# Maintainer: edombek <edombek@yandex.ru>
pkgname=casa6
pkgver=6.5.2
pkgrel=28
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=()
conflict=('')
instdir="/opt/${pkgname}"
provides=("casa")
source=("https://casa.nrao.edu/download/distro/casa/release/rhel/casa-${pkgver}-${pkgrel}-py3.8.tar.xz")
md5sums=('eb37e8e163d5f84b84a99ec4e17885d4')
package() {
  # Copy out files
  install -m755 -d "${pkgdir}/${instdir}"
  mv -T "${srcdir}/casa-${pkgver}-${pkgrel}-py3.8" "${pkgdir}/${instdir}/"
  # Symlink executables
  install -m755 -d "${pkgdir}/usr/bin/"
  for _executable in buildmytasks  casa  casaviewer  mpicasa; do
    ln -s "${instdir}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done 
}
