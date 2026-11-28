# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zbpack-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Build projects into static assets, serverless functions or container images"
arch=('x86_64' 'aarch64')
url="https://github.com/zeabur/zbpack"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zeabur/zbpack/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zbpack-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zbpack-linux-arm64.tar.gz")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_x86_64=('6141198f26084f76eef2579db88faaeae38e1c6748c688ba8ea3ddd6fad4bc01')
sha256sums_aarch64=('c20ce52399d50c40b83513e6643708ef0382bcdc86fd5c372ed3793ccadcdc6b')

package() {
  install -Dm755 "zbpack" "${pkgdir}/usr/bin/zbpack"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
