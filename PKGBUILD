# Maintainer: Josephine Pfeiffer <josie@redhat.com>
# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.14.2
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

sha256sums_x86_64=('555e8cc50b191c3dd9b5734ab530987b1ef8198e6ad2c372fed8c849f90ee0e9')
sha256sums_s390x=('c63624311be794f52f544e63d92be053733c4cab87ead8e52b1bc366ccacc9ed')
sha256sums_arm64=('d553e3244e3f796228d787c9f9190d67c7314a4a0cbf68d2a8281870267e8f28')
sha256sums_ppc64le=('050d1eed12441fd1fff07d75c2f94cad29695f81258fb81671a9a7dc44efd7c6')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
