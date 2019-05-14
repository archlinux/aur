pkgname=inferno-git
pkgver=r162
pkgrel=1
pkgdesc="A Rust port of FlameGraph"
arch=('i686' 'x86_64')
url="https://github.com/jonhoo/inferno"
license=('CDDL')
makedepends=('git' 'rust')
source=("${pkgname}::git+https://github.com/jonhoo/inferno")
md5sums=('SKIP')

build() {
  cd "${pkgname}"
  cargo build --release
}

package() {
  cd "${pkgname}"
  echo $(pwd)

  install -D "target/release/inferno-collapse-perf" "${pkgdir}/usr/bin/inferno-collapse-perf"
  install -D "target/release/inferno-collapse-dtrace" "${pkgdir}/usr/bin/inferno-collapse-dtrace"
  install -D "target/release/inferno-collapse-guess" "${pkgdir}/usr/bin/inferno-collapse-guess"
  install -D "target/release/inferno-flamegraph" "${pkgdir}/usr/bin/inferno-flamegraph"
  install -D "target/release/inferno-diff-folded" "${pkgdir}/usr/bin/inferno-diff-folded"
}
