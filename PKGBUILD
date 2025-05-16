# Maintainer: Your Name <your.email@example.com>

pkgname=sealos
pkgver=5.0.1
pkgrel=1
pkgdesc="A cloud operating system designed for managing cloud-native applications"
arch=('x86_64' 'aarch64')
url="https://github.com/labring/sealos"
license=('Apache')
depends=('docker' 'kubectl')
provides=('sealos')
conflicts=('sealos')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/labring/sealos/releases/download/v${pkgver}/sealos_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/labring/sealos/releases/download/v${pkgver}/sealos_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('92a7234f73d510b6faad975fa09139bb2ea9f52e255e9bc196e2e028ca60224b')
sha256sums_aarch64=('d6fbaa0692e5a98a6695358f1994fed999e41adfca3784a97886a8fca306bf05')

package() {
  cd "${srcdir}"
  
  # 安装所有二进制文件
  install -Dm755 sealos "${pkgdir}/usr/bin/sealos"
  install -Dm755 sealctl "${pkgdir}/usr/bin/sealctl"
  install -Dm755 image-cri-shim "${pkgdir}/usr/bin/image-cri-shim"
  install -Dm755 lvscare "${pkgdir}/usr/bin/lvscare"
  
  # 安装文档
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 README_zh.md "${pkgdir}/usr/share/doc/${pkgname}/README_zh.md"
  
  # 安装 license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
