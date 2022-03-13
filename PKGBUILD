# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.2.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "arm" "armv6h" "armv7h"  "i686" "x86_64")
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
backup=("etc/alist/config.json")
source=("alist.service" "config.json")
install=alist.install
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm64.tar.gz")
source_arm=("$_pkgname-$pkgver-arm.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm-5.tar.gz")
source_armv6h=("$_pkgname-$pkgver-armv6h.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm-6.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm-7.tar.gz")
source_i686=("$_pkgname-$pkgver-i686.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-386.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-amd64.tar.gz")
sha256sums=('b96d55f7e83310a7556a5b023be60e12f44c484e3e136f1488d737126c9ed34f'
'ba9cd5b593313183ad8c0f008a6edba539063193c416d3893a5344e104a3fff1'
)
sha256sums_aarch64=('d975385cb31736233e52e6fbc2f1bb2566fe06fa2a478c223d359938c4010220')
sha256sums_arm=('f63d1b49c7c3fd322bceb30881435e5abcb3517b2b1fc5b388b16d51ae862de5')
sha256sums_armv6h=('d8df62e2a01673aee9ff893e0e596b3937a7e1ddf1efa7177603b5de135ae53a')
sha256sums_armv7h=('a7598bcdb2858c9517c23dab6131308276e1732e6b44ed163589aabc188af318')
sha256sums_i686=('63d2871eae404f1be001016bda5b5dc6de36f86a0496c56bcea2238fd686a6aa')
sha256sums_x86_64=('6ffd7d711b75949e7963b60bb5c5dbbd213fd1b58616f632812fbaa7cbeeaa5d')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}