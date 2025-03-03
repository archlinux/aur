# Maintainer: Josephine Pfeiffer <josie@redhat.com>
# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.14.1
pkgrel=1
pkgdesc='Kubernetes performance and scale test orchestration framework written in golang.'
arch=('x86_64' 's390x' 'arm64' 'ppc64le')
url='https://github.com/kube-burner/kube-burner'
license=('Apache 2')
provides=('kube-burner-bin')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-x86_64.tar.gz")
source_s390x=("${_pkgname}-${pkgver}-s390x.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-s390x.tar.gz")
source_arm64=("${_pkgname}-${pkgver}-arm64.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-arm64.tar.gz")
source_ppc64le=("${_pkgname}-${pkgver}-ppc64le.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-ppc64le.tar.gz")

sha256sums_x86_64=('1486d2aa981d4d7021a8c5e98a3a00af2214f38c6daa6961630cbda28fb249c3')
sha256sums_s390x=('b1c156548177ccdfcf7cf85ae72f76380880661f565bd32c10fbe02aeb3f452a')
sha256sums_arm64=('c1f77575491039b3b24eca1b6b4298fe6297380386a09a015ef96eb508580a6b')
sha256sums_ppc64le=('6138ec68c3645d4cf1c2b4f28d65ff425eaf9a6d332008b85fc26b832408b04b')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
