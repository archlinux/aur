# Maintainer: Christopher Lopes <christopher [dot] lopes [at] pm [dot] me>

_pkgname=duplicacy
pkgname=${_pkgname}-cli-bin-git
pkgver=2.7.2
pkgrel=2
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/gilbertchen/duplicacy'
license=('custom')
source=("${url}/releases/download/v${pkgver}/${_pkgname}${_platform}${pkgver}"
        'https://raw.githubusercontent.com/gilbertchen/duplicacy/master/LICENSE.md')

source_x86_64=("${_pkgname}${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x64_${pkgver}")
source_aarch64=("${_pkgname}${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64_${pkgver}")
source_armv7h=("${_pkgname}${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm_${pkgver}")

sha256sums_x86_64=('b83c2c8095839f00b7851967615e81ca4fbd4d255b4bfde9da9ba74ff85a852d')
sha256sums_aarch64=('df37d479a01dde0717663b873a2b338927c22a04395ad70f4388c88e36436309')
sha256sums_armv7h=('fe92fe2bff4941a3c165cb9a02666457d871973396006dedbaea66009798fc8d')

source=('https://raw.githubusercontent.com/gilbertchen/duplicacy/master/LICENSE.md')
sha256sums=('f5470a1440ab371c5b21026a0b28a1777345183017ece8b5c7552d58501c52bf')


package() {
  # License
  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  install -D -m755 "${srcdir}/${_pkgname}${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
