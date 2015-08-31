# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname=objdigger
pkgver=1.1 # The binary is v0.06.01, don't know which to use.
pkgrel=1
pkgdesc="Automated static analysis tools for binary programs"
url="https://portal.cert.org/web/mc-portal/pharos-static-analysis-tools"
license=('custom')
source=("ObjdiggerTool.7z"::"https://portal.cert.org/documents/133850/0/Objdigger+Tool/66ab5d1d-f275-4890-adce-d12bc9de0cbf?version=${pkgver}")
sha512sums=('7595c078e2e877080756b22859fb263107585c6291614ff089a153c31ae8173675b14685fbe14128e4b6bccc87682772749e59db70a30ba9dcf23937e79b470a')
arch=('x86_64') # No i686.
depends=('') # Statically built.
options=('!strip') # Does not do anything, waste of time.

package() {
  install -Dm 644 "${srcdir}/objdigger/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/objdigger/objdigger" "${pkgdir}/usr/bin/objdigger"
  # I will later make a proper package that installs PyObjdigger.py as well.
}

# vim:set et sw=2 sts=2 tw=80: