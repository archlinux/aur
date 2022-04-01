# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.3.2
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
            'ba9cd5b593313183ad8c0f008a6edba539063193c416d3893a5344e104a3fff1')
sha256sums_aarch64=('965d9dce5b8657ad0dfd0e9a2d51a286956a4dc88b5543116ed77c33d1482425')
sha256sums_arm=('cb110c130610d15ebd92dd3ed1a5519bec4e169a2189c0a3f3a63b4d399c12fc')
sha256sums_armv6h=('bdbf33822b38b5b54ba4e3f60b7aa5ee54227bbde736a639fda5694dd549312e')
sha256sums_armv7h=('a1c81e820511fb89ceedbcac1330df6361dca6c390eb0365276ee84238467fc2')
sha256sums_i686=('7c9fd01b79734cfe9515bc609bc80f17d94abac5deedde248cc8b9b4fa4a6bd3')
sha256sums_x86_64=('67c18f3d282bacaaf1f93055ce04785499df035467a808923c48dc805d91c8f5')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
