# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.4.1
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
sha256sums_aarch64=('4767c92aa7738b9b86342dcbf137ee399e71d10737a866bf4510d82f24b4acb9')
sha256sums_arm=('773a0da88c896545f9cd81d4f157ace7c2879200189e8fdb4ce2a3de75bfa757')
sha256sums_armv6h=('9113f5db51bee74aae0793aea6e16f1d2dbc1be2678647b9864db8ca74592fd8')
sha256sums_armv7h=('7991c240206175a749650366a7db8ab9cfb089982b4750fc1f05828faa4c28db')
sha256sums_i686=('8783a09c3387e17909f8f0bcb73f34444112dd0597f9484e291821bebb5bb5c0')
sha256sums_x86_64=('6ebab7fec041aaab90a8e82ef3a6133a69e935c3173ceb18f645f853f5a248b1')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
