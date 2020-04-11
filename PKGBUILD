# Maintainer: Christopher Lopes <christopher [dot] lopes [at] pm [dot] me>

_pkgname=duplicacy
_platform=_linux_x64_
pkgname=${_pkgname}-cli-bin-git
pkgver=2.5.0
pkgrel=1
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64')
url='https://github.com/gilbertchen/duplicacy'
license=('custom')
source=("${url}/releases/download/v${pkgver}/${_pkgname}${_platform}${pkgver}"
        'https://raw.githubusercontent.com/gilbertchen/duplicacy/master/LICENSE.md')
sha256sums=('9edd5d999163fb6a98fa5124cc6b95350d5f40d23c33e49eed5dbcdbe347ffb2'
            'f5470a1440ab371c5b21026a0b28a1777345183017ece8b5c7552d58501c52bf')

package() {
  # License
  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  install -D -m755 "${srcdir}/${_pkgname}${_platform}${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
