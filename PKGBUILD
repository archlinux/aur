#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=doxyparse
_actual_ver=1.8.11
_extra_ver=20090622
pkgver=${_actual_ver}_${_extra_ver}
pkgrel=1
pkgdesc="Parses source code and dumps the dependencies between the code elements."
groups=('analizo')
arch=('any')
url="http://analizo.org"
license=('GPLv2')
makedepends=('qt4' 'git' 'flex')
source=(
        "https://github.com/analizo/doxyparse/archive/upstream/${_actual_ver}.tar.gz"
       )
sha512sums=(
            'c1d45462deafde71b85d9db4af0f8fd564b45a16aebc0397b4ff2827dc4db5a5520d9e31328d262b41dca341594c2a4c65000e0af11c7c67c371ba4ec80bdfcf'
           )

build(){
  cd "${srcdir}"

  cd "doxyparse-upstream-${_actual_ver}"
  
  cmake -Dbuild_parse=YES .
  make
}

package(){
  cd "${srcdir}/doxyparse-upstream-${_actual_ver}"

  make DESTDIR="${pkgdir}/" install
}

