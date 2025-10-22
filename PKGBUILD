#
# PKGBUILD for fireminipro
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#
pkgname=fireminipro
_pkgname=${pkgname}
pkgver=0.1.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="MiniPro GUI wrapper for MiniPro CLI"
arch=("x86_64")
url="https://github.com/Jartza/fireminipro"
license=("MIT")
depends=("qt6-base" "gcc-libs" "minipro")
makedepends=("cmake")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://github.com/Jartza/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=("853c8fad553ddc6a48e263facd28673511ea1133632b4e917b4eaa0a7e820978")

#pkgver()
#{
#  cd "${srcdir}/${_pkgname}-${_pkgver}"
#  #cd "${srcdir}/${_pkgname}"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  #cd "${srcdir}/${_pkgname}"
}

build()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  #cd "${srcdir}/${_pkgname}"
  cmake -S . -B _build.out -DCMAKE_BUILD_TYPE=MinSizeRel
  cmake --build _build.out
}

check()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  #cd "${srcdir}/${_pkgname}"
}

package()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  #cd "${srcdir}/${_pkgname}"
  cmake --install _build.out --prefix "${pkgdir}"
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 0755 _build.out/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
