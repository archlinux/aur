# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.2
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
sha256sums_aarch64=('acf5188459642466580ad1a6b4f39921b4108e7aa695d08e762c1ec5fd82af0a')
sha256sums_arm=('b40de0d8a0b6db449f8cff2a43f77ae2061f4ca695a25643130b64bd37317ee1')
sha256sums_armv6h=('4b339574ae27e764992940d46fa615da154eedca43e89f869474993be06047bf')
sha256sums_armv7h=('a192908e40a072b1576c6d3713d9e961d0fc34557506437d7bfe0192fa4abe5a')
sha256sums_i686=('ca87612deca5cf1f24c32aaf00f1cbc25d4d6dbea1094fdeb9ecfbb648d458ff')
sha256sums_x86_64=('cab7cc65a2b853baef1064bb0f4a1d9c844830e2f2b3aaa812107fd48658034a')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
