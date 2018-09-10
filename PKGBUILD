# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=7a93ca76badd71cfd7dd19fb3048830f6e29fac7
pkgname=lpcli
pkgver=2018.06.15
pkgrel=1
pkgdesc='C implementation of lesspass (version 2) without any external dependencies'
arch=('any')
url='https://github.com/monolifed/lpcli'
license=('Unlicense')
depends=('glibc')
optdepends=('xclip: to copy generated passwords to clipboard')
source=("https://github.com/monolifed/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('86e5f3afa575fbf2b947197e95a14b4440e7701620f5de36bee9d1a28b124d35')

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
