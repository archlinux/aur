# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gitcommit=4987c60375baaa5424eb5a3ab9856acc1bb8a669

pkgname=repos
pkgver=0.1.0+1+4987c60
pkgrel=1
pkgdesc="A simple command tool to manage local repositories"
url="https://github.com/zhangkaizhao/repos"
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'Apache')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m755 target/release/repos "${pkgdir}/usr/bin/repos"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -D -m644 doc/repos.1 "${pkgdir}/usr/share/man/man1/repos.1"
}
