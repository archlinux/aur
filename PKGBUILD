# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=fdr
pkgver=3.1.0
pkgrel=1
pkgdesc="Refinement checker for CSP"
arch=('x86_64')
url="https://www.cs.ox.ac.uk/projects/fdr/"
license=('custom')
source=("https://www.cs.ox.ac.uk/projects/fdr/downloads/fdr3-3236-linux-x86_64.tar.gz")
md5sums=('1992fe4a357a0a0db3a8aba3f345a1ad')
sha1sums=('fe603696365080e7c8ba77b0e4de5126b2f28878')
sha256sums=('64440b16adf3f93fecdd3872f7cd6ea75febd53db1947b493e0952967bdf7865')

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
