# Maintainer: Sauyon Lee <arch@sauyon.com>
# Contributor: Douglas Creager <dcreager@dcreager.net>
pkgname=fdr
pkgver=4.2.3
pkgrel=1
pkgdesc="Refinement checker for CSP"
arch=('x86_64')
url="https://www.cs.ox.ac.uk/projects/fdr/"
license=('custom')
depends=('libtinfo5' 'openssl-1.0')
source=('https://www.cs.ox.ac.uk/projects/fdr/downloads/fdr-3789-linux-x86_64.tar.gz')
sha256sums=('08c5a0a91e049ccab2930515d32df36722a4a03f79cc47b96abd540f59c45e58')

package() {
  install -d "${pkgdir}/opt/fdr"
  cp -r "${srcdir}/fdr/"{bin,lib} "${pkgdir}/opt/fdr"
  install -d "${pkgdir}/usr"
  cp -r "${srcdir}/fdr/include" "${pkgdir}/usr"

  install -d "${pkgdir}/usr/bin"
  for c in cspmchecker cspmcheckeri fdr4 refines; do
      ln -s "../../opt/fdr/bin/$c" "${pkgdir}/usr/bin"
  done

  install -d "${pkgdir}/usr/share/doc/fdr"
  cp -r "${srcdir}/fdr/fdr-examples" "${pkgdir}/usr/share/doc/fdr/examples"
}

# vim:set ts=2 sw=2 et:
