# Contributor: Baytars <feicuihuangfeng@qq.com>
# Maintainer: Baytars <feicuihuangfeng@qq.com>
pkgname=fastp
pkgver=r337.424900e
pkgrel=1
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('any')
depends=('zlib')
makedepends=('git' 'make')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  make
}
package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/local/bin/${pkgname}"
  install ${pkgname} ${pkgdir}/usr/local/bin/${pkgname}
}
