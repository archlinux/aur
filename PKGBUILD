# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=38392a70b60c0adf7b242ea60a1993aecc125008
pkgname=lpcli
pkgver=2020.04.15
pkgrel=1
pkgdesc='C implementation of lesspass (version 2) without any external dependencies'
arch=('any')
url='https://github.com/monolifed/lpcli'
license=('Unlicense')
depends=('libx11')
optdepends=('xclip: to copy generated passwords to clipboard')
source=("https://github.com/monolifed/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('61b5f3880f73aa8a8609e60e91cfec7a286118fc499e75054fb7c1b264f9149b')

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  # binary
  install -Dm755 lpcli \
    "${pkgdir}/usr/bin/lpcli"
  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # readme
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
