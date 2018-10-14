# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Christopher Loen <christopherloen at gmail dot com>

pkgname=aesfix
pkgver=1.0.1
pkgrel=2
pkgdesc='Error-correction for AES key schedules'
arch=('x86_64')
url='https://citp.princeton.edu/research/memory/'
license=('BSD')
depends=('gcc-libs')
source=("http://citpsite.s3-website-us-east-1.amazonaws.com/oldsite-htdocs/memory-content/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7b177e876caee6aae48f0123102f11df6594a738483f9a47f2c76fe81cc045d4')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # Base directories
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  # Docs
  cp -rf samples "${pkgdir}/usr/share/${pkgname}/"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Executable
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
