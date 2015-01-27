# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=fdr
pkgver=3.0.0
pkgrel=1
pkgdesc="Refinement checker for CSP"
arch=('x86_64')
url="https://www.cs.ox.ac.uk/projects/fdr/"
license=('custom')
source=("https://www.cs.ox.ac.uk/projects/fdr/downloads/fdr3-linux-x86_64.tar.gz")
md5sums=('191d2538a4f5287e7bae4ebe15d0cb01')
sha1sums=('7cab897ea6612dce5e19497cddbf0ab573172fea')
sha256sums=('a3646630cafa3c30630ee55c597b3c27ef346eb0d2eee6d2b2d10f1317adeef8')

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
