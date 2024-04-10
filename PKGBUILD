# Maintainer: Jrnr601 <jeroen at robben dot io>
# Contributor(s): Michael Leuschel and others
# Contributor(s): Formal Mind
# Contributor(s): Heinrich-Heine-University

_major_version='1.13'
_minor_version='0'

pkgname='prob'
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="ProB Animator and Model Checker"
arch=('x86_64')
url="https://www3.hhu.de/stups/prob/"
license=('EPL 1.0')
depends=('tk>=8.5.0'
         'tcl>=8.5.0'
         'java-runtime')
optdepends=('graphviz: visualizations'
            'gv: PostScript visualizations')

source_x86_64=("http://www3.hhu.de/stups/downloads/prob/tcltk/releases/${_major_version}.${_minor_version}/ProB.linux64.tar.gz")
md5sums_x86_64=('c2ca46e1b7343948e974a8a8f852bd4e')


package() {
  rm ${srcdir}/ProB.linux64.tar.gz

  mkdir -p ${pkgdir}/opt/prob
  cp -dR ${srcdir}/ProB/* ${pkgdir}/opt/prob/

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/prob/prob" "${pkgdir}/usr/bin/prob"
  ln -s "/opt/prob/probcli" "${pkgdir}/usr/bin/probcli"
}
