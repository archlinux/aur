# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=remove_empty_subdirs
pkgver=0.1.1
pkgrel=1
pkgdesc="Recursively remove empty sub-directories"
url="https://github.com/zhangkaizhao/remove_empty_subdirs"
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'Apache')
conflicts=('remove_empty_subdirs-git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release --examples
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m755 target/release/examples/remove_empty_subdirs "${pkgdir}/usr/bin/remove_empty_subdirs"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
