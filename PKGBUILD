# Maintainer: fuero <fuerob@gmail.com>
pkgname=x86-64-level
# renovate: datasource=github-releases depName=HenrikBengtsson/x86-64-level
pkgver=0.2.2
pkgrel=1
pkgdesc='Get the x86-64 Microarchitecture Level on the Current Machine'
arch=('x86_64')
url="https://github.com/HenrikBengtsson/x86-64-level"
source=(
  ${url}/archive/refs/tags/${pkgver}.tar.gz
)
md5sums=('5f0782178797968102d1a4269c252ce4')
license=('CC-BY-SA-4.0')
depends=(
  bash
)
checkdepends=(
  make
  shellcheck
)
makedepends=(
  python-build
)

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done

}

check() {
  cd "$pkgname-$pkgver"
  make check
}
