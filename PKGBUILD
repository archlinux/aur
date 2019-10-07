# Maintainer: Your Jonathan Donszelmann <jonabent@gmail.com>

pkgname="dumpasm-git"
pkgver=4.a294cba
pkgrel=1
pkgdesc="compile semicolon seperated assembly instructions and hexdump"
arch=('x86_64')
url="https://github.com/jonay2000/${pkgname}"
license=('GPL')
depends=('binutils')
makedepends=('git')

source=("${pkgname%-git}::git://github.com/jonay2000/dumpasm.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/dumpasm"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/dumpasm"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  
  cp "${srcdir}/dumpasm/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "${srcdir}/dumpasm/dumpasm" "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/dumpasm"
}

