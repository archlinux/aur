# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=openring
pkgver=1.0.1
pkgrel=1
pkgdesc="A webring for static site generators"
arch=('x86_64')
url="https://sr.ht/~sircmpwn/openring/"
conflicts=('openring')
provides=('openring')
license=('GPL3')
makedepends=('go')
source=("https://git.sr.ht/~sircmpwn/openring/archive/${pkgver}.tar.gz")
sha256sums=('9df83d980473fc85d5e8df8bf55e509a90751d6be32500a304216108da4d17ca')

build() {
  cd "${srcdir}/${pkgname}"
  GOPATH="${srcdir}/go" GOCACHE="${srcdir}/cache" go build -o "${pkgname}"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}/LICENSES"/* -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
