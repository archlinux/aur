# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kube-job-bin
pkgver=0.37.0
pkgrel=1
pkgdesc="Run one-off jobs on Kubernetes from the command line"
arch=('x86_64')
url="https://github.com/h3poteto/kube-job"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/h3poteto/kube-job/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/kube-job_v${pkgver}_linux_amd64.zip")
sha256sums=('368aebddf2607d66db6b8a53d29303ffe2fc8311485e1d69ab80061477308a45')
sha256sums_x86_64=('907b698ff7f8d26af93b36f57b14cc2519eaa043b8b78a83a6f03346caacf537')

package() {
  install -Dm755 "kube-job" "${pkgdir}/usr/bin/kube-job"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
