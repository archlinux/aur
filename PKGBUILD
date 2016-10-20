# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=peco
pkgver=0.4.3
pkgrel=1
pkgdesc='Simplistic interactive filtering tool'
arch=('i686' 'x86_64')
url='https://github.com/peco/peco'
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}.x86_64.tar.gz"::"https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_amd64.tar.gz")
source_i686=("${pkgname}-${pkgver}.i686.tar.gz"::"https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_386.tar.gz")
md5sums_x86_64=('eccb3f869d96e5851b20f5569294f3e2')
md5sums_i686=('ef4b1db3886a1f42d4b5ddbdf3905b89')

package() {
  if [ $CARCH = "x86_64" ]; then
    cd "${pkgname}_linux_amd64"
  else
    cd "${pkgname}_linux_386"
  fi

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
