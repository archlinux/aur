# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=mtftar-git
_pkgname=mtftar
pkgver=14.6b0a4e1
pkgrel=1
pkgdesc='A tool for translating a MTF stream to a TAR stream.'
arch=('x86_64')
url='https://github.com/sjmurdoch/mtftar'
license=('GPL2')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
provides=('mtftar')
conflicts=('mtftar')
source=("git+https://github.com/sjmurdoch/mtftar.git")
md5sums=('SKIP')
        
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/"
}
