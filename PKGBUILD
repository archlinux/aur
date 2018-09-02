# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=remove_empty_subdirs
_gitcommit=63b467784e2a43c7c55432369702baa3e66cd1b2

pkgname=remove_empty_subdirs-git
pkgver=0.1.0+1+63b4677
pkgrel=1
pkgdesc="Recursively remove empty sub-directories"
url="https://github.com/zhangkaizhao/remove_empty_subdirs"
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'Apache')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --examples
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 target/release/examples/remove_empty_subdirs "${pkgdir}/usr/bin/remove_empty_subdirs"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
