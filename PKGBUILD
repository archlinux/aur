# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=fdr
pkgver=4.2.0
pkgrel=1
pkgdesc="Refinement checker for CSP"
arch=('x86_64')
url="https://www.cs.ox.ac.uk/projects/fdr/"
license=('custom')
depends=('libtinfo5')
source=("https://www.cs.ox.ac.uk/projects/fdr/downloads/fdr-3754-linux-x86_64.tar.gz")
md5sums=('c09a05a5d9b54fc65ed12de8b7cdfc11')
sha1sums=('946eb00282fb1513d21d8aa2c8ab17ce3e37a997')
sha256sums=('d24492485db9b8b95c62c53a6396094f836ee079cfc743688a397503c3ec9bf8')

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/fdr" "${pkgdir}/opt/fdr"

  mkdir -p "${pkgdir}/usr/bin"
  for c in cspmchecker cspmcheckeri fdr4 refines; do
      ln -s "../../opt/fdr/bin/$c" "${pkgdir}/usr/bin"
  done

  mkdir -p "${pkgdir}/usr/share/doc/fdr"
  ln -s "../../../../opt/fdr/fdr-examples" "${pkgdir}/usr/share/doc/fdr/examples"
}

# vim:set ts=2 sw=2 et:
