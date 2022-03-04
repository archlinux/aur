# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.1
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
sha256sums_aarch64=('4ab7af5cdc3bdbb54414db7d822d2823871f57cd46aeb050b0e88f1fd42b84e8')
sha256sums_arm=('1ce5a4769bb7d6bf98a6811fbc7cd06d199490629123e930d80e890cf4ee482e')
sha256sums_armv6h=('1f9133d5b740644b78f34b1046973d64e158ce500c55afb32c019d7bcac3cac5')
sha256sums_armv7h=('267b49c60fa470d1a1fff2ac8c397d3cf532c3140b29dbebf3428988ef164ef7')
sha256sums_i686=('6d1d1f09e6f7cba5b30661890009ce989849c0d110c1e55266c6733f159e75c3')
sha256sums_x86_64=('652a74c855909740ed8c744b75d07af0fe7fd41da79c3d17e82b0ed64c2ad4ce')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
