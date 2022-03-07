# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.3
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
sha256sums_aarch64=('2bb54a6830f22c588d29d434856f4d2a544906c7e5d9c730f633bc58d1970e6f')
sha256sums_arm=('69abfadf266a2a43dfd5cffa0dbddc4e4440bc746d6baf171d0ff9147ab38bc5')
sha256sums_armv6h=('3fc26c5bb86f940bb05a38167fa61544de0b84bdb6eb82afaeb0dfe9442926d4')
sha256sums_armv7h=('c9749e48195d328939f3bad94d75b559d68d1ef5da55665af77120d0cb3e1130')
sha256sums_i686=('f963bca4afcc9474f07482cd0efdd5c02b9f3611fe9d54e0819b543589df166d')
sha256sums_x86_64=('8058dc641bf79c68091ec2098285472cd827fe7429bec89d455cf9e0e922e0e2')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}