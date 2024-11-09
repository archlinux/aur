# Maintainer: OGIOS <ogios@foxmail.com>

pkgname=cptserv-server
pkgver=4
pkgrel=2
pkgdesc="Cross platform data synchronization"
arch=("x86_64" 'aarch64')
url="https://github.com/CPTServ/TServ"
license=("GPL3")
makedepends=('go')
_exename=TServ
provides=($_exename)
source=("${url}/releases/download/v${pkgver}/${_exename}"
  "${pkgname}.service"
  "TServ.sh")
sha256sums=("SKIP" "SKIP" "SKIP")
options=(!debug)

package() {
  install -Dm755 "${_exename}" "${pkgdir}/usr/bin/${_exename}"
  install -Dm755 "${_exename}.sh" "${pkgdir}/usr/bin/${_exename}.sh"
  cd $srcdir
  install -Dm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/user"
}
