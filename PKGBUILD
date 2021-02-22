# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=adf6df24725dd436b29c41ed7169b068137ff9a6
pkgname=lpcli
pkgver=2020.07.17
pkgrel=1
pkgdesc='C implementation of lesspass (version 2) without any external dependencies'
arch=('any')
url='https://github.com/monolifed/lpcli'
license=('Unlicense')
depends=('libx11')
optdepends=('xclip: to copy generated passwords to clipboard')
source=("https://github.com/monolifed/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('2783c6ed92a5fed1bf7fcac68b6f84814a2a299a26584441005274613e246acc')

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
