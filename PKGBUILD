#srcdio Maintainer: DenBrahe <denbrahe at hotmail dot com>
# Contributor(s): Michael Leuschel and others
# Contributor(s): Formal Mind
# Contributor(s): Heinrich-Heine-University

_major_version='1.7'
_minor_version='1'

pkgname='prob'
pkgver=${_major_version}.${_minor_version}
pkgrel=2
pkgdesc="ProB Animator and Model Checker"
arch=('x86_64')
url="http://eclipseclp.org/"
license=('EPL 1.0')
depends=('tk85'
         'tcl85'
         'java-runtime')
optdepends=('graphviz: visualizations'
            'gv: PostScript visualizations')

source_x86_64=("http://www3.hhu.de/stups/downloads/prob/tcltk/releases/${_major_version}.${_minor_version}/ProB.linux64.tar.gz")
md5sums_x86_64=('eb74b2991967f0a8ed8669c4186ac1fa')


package() {
  rm ${srcdir}/ProB.linux64.tar.gz

  mkdir -p ${pkgdir}/opt/prob
  cp -dR ${srcdir}/ProB/* ${pkgdir}/opt/prob/

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/prob/prob" "${pkgdir}/usr/bin/prob"
  ln -s "/opt/prob/probcli" "${pkgdir}/usr/bin/probcli"
}
