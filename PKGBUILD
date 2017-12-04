# Maintainer : Shawn Dellysse sdellysse@gmail.com
pkgname=farch
pkgver=0.0.20171203c
pkgrel=1
pkgdesc="Functional archlinux system configuration tool"
url="https://github.com/shawndellysse/farch"
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://github.com/shawndellysse/farch/archive/v${pkgver}.tar.gz")
md5sums=('e0a5aa733b32973c9615f7e195e1f8e6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install --production
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"


  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -a . "${pkgdir}/usr/share/${pkgname}"

  cd "${pkgdir}/usr/bin"
  ln -sf ../share/${pkgname}/bin/* .
}
