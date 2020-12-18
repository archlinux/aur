# Maintainer: Christopher Lopes <christopher [dot] lopes [at] pm [dot] me>

_pkgname=duplicacy
_platform=_linux_x64_
pkgname=${_pkgname}-cli-bin-git
pkgver=2.7.2
pkgrel=1
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64')
url='https://github.com/gilbertchen/duplicacy'
license=('custom')
source=("${url}/releases/download/v${pkgver}/${_pkgname}${_platform}${pkgver}"
        'https://raw.githubusercontent.com/gilbertchen/duplicacy/master/LICENSE.md')
sha256sums=('b83c2c8095839f00b7851967615e81ca4fbd4d255b4bfde9da9ba74ff85a852d'
            'f5470a1440ab371c5b21026a0b28a1777345183017ece8b5c7552d58501c52bf')

package() {
  # License
  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  install -D -m755 "${srcdir}/${_pkgname}${_platform}${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
