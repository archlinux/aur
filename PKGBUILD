# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=fdr
pkgver=3.4.0
pkgrel=1
pkgdesc="Refinement checker for CSP"
arch=('x86_64')
url="https://www.cs.ox.ac.uk/projects/fdr/"
license=('custom')
depends=('libtinfo')
source=("https://www.cs.ox.ac.uk/projects/fdr/downloads/fdr3-3702-linux-x86_64.tar.gz")
md5sums=('6dc3f8ee5fad19ae595c0d0dc9097026')
sha1sums=('abb58025b91d04d7425b9a9d05244116c255df29')
sha256sums=('767a61592208273a9209f44424f4d1a89ed560dcb027bca6d457baf469bffaf7')

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/fdr3" "${pkgdir}/opt/fdr"

  mkdir -p "${pkgdir}/usr/bin"
  for c in cspmchecker cspmcheckeri fdr3 refines; do
      ln -s "../../opt/fdr/bin/$c" "${pkgdir}/usr/bin"
  done

  mkdir -p "${pkgdir}/usr/share/doc/fdr"
  ln -s "../../../../opt/fdr/fdr-examples" "${pkgdir}/usr/share/doc/fdr/examples"
}

# vim:set ts=2 sw=2 et:
