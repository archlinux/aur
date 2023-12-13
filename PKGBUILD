# Maintainer : Philipp Seiler <p (dot) seiler (at) linuxmail (dot) org>

pkgname=zhlt
pkgver=34
pkgrel=1
pkgdesc="goldSrc map compiling tools (bsp, csg, rad, vis, ripend)"
arch=(any)
url="https://gamebanana.com/tools/5391"
license=('GPL')
#depends=('ruby')
#makedepends=('')
source=("https://twhl.info/wiki/embed/Vluzacn's_ZHLT_v34")
#noextract=($_gemname-${pkgver//_/-}.gem)

build() {
  cd "$srcdir"
  unzip -o src.zip
  cd "zhlt-vluzacn"
  make
}

package() {
  cd "${srcdir}/zhlt-vluzacn"
  for file in hlbsp hlvis hlcsg hlrad ripent
  do
      install -D -m 0755 "bin/${file}" "${pkgdir}/usr/bin/${file}" 
      echo ""
  done
}
sha256sums=('d5c64a9203009f235fb287ee7e767e8c30b9d817033a1bcab96531c3064e7a31')
