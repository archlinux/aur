# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=fdr
pkgver=3.2.3
pkgrel=1
pkgdesc="Refinement checker for CSP"
arch=('x86_64')
url="https://www.cs.ox.ac.uk/projects/fdr/"
license=('custom')
depends=('libtinfo')
source=("https://www.cs.ox.ac.uk/projects/fdr/downloads/fdr3-3377-linux-x86_64.tar.gz")
md5sums=('8c7cfc38380d393b4e4082830f9959f1')
sha1sums=('85236729457e5b4e51594022f51eee6e4db5a327')
sha256sums=('358d1e93c72c67e62a079bd031acf75c4b7bd8ba8a9c673ad90f2b2367d39ba5')

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
