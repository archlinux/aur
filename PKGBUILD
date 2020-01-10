# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=8eda62e004e8341b9b4f353af8f147b76609cb5f
pkgname=lpcli
pkgver=2019.07.27
pkgrel=1
pkgdesc='C implementation of lesspass (version 2) without any external dependencies'
arch=('any')
url='https://github.com/monolifed/lpcli'
license=('Unlicense')
depends=('libx11')
optdepends=('xclip: to copy generated passwords to clipboard')
source=("https://github.com/monolifed/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('daba0c9d46010935ba4638fcb2d9758f31580504db0e42150ef8e2484ee6bbce')

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
