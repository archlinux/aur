# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=horusec-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Security analysis tool that finds vulnerabilities in a project with one command"
arch=('x86_64' 'aarch64')
url="https://github.com/ZupIT/horusec"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ZupIT/horusec/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/horusec_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/horusec_linux_arm64")
sha256sums=('eb7b8d9bb48af4a22c743ab9645d4767361889bf7e4af19c0d06219e99b48667')
sha256sums_x86_64=('93c001a0b1efea27c74bfc3e9b57d4bc55ec2d7ffc9015674a19844d8677d9c8')
sha256sums_aarch64=('92ea630d69c3a47d18f73e0521f1592c1fb07c6008b8b6f79d9798d7c62a608d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/horusec"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
