# Maintainer : Shawn Dellysse sdellysse@gmail.com
pkgname=effuvv
pkgver=0.0.20171212
pkgrel=1
pkgdesc="Functional archlinux system configuration tool"
url="https://github.com/shawndellysse/effuvv"
arch=("any")
depends=("nodejs")
conflicts=("farch")
makedepends=("npm")
source=("https://github.com/shawndellysse/effuvv/archive/v${pkgver}.tar.gz")
md5sums=('63bf5b34ce5f3e9b9691907f664d36b1')

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
