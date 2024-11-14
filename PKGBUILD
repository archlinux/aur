# Maintainer: Nandor Magyar < nandor magyar dot it at gmail dot com>

_name=azcopy
pkgname=azcopy-bin
pkgver=10.27.1
pkgrel=2
pkgdesc="A command-line utility that you can use to copy data to and from containers and file shares in Azure Storage accounts."
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Azure/azure-storage-azcopy/v${pkgver}/LICENSE")
source_x86_64=("${_name}-bin-${pkgver}-x86_64::https://aka.ms/downloadazcopy-v10-linux")
sha256sums=('e9ca6f8518c969a4d3bb98030581771975a90730a27d294123855c90a31eddcc')
sha256sums_x86_64=('b66b35c564b88c2e89f0c6b179ea52c42f1dd35924e2f0ebbbc5ff39c94f1d2c')
package() {
    install -Dm755 "${srcdir}/${_name}_linux_amd64_${pkgver}/${_name}" "${pkgdir}/usr/bin/${_name}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
