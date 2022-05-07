# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.5.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "arm" "x86_64")
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
backup=("etc/alist/config.json")
source=("alist.service" "config.json")
install=alist.install
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-amd64.tar.gz")
sha256sums=('b96d55f7e83310a7556a5b023be60e12f44c484e3e136f1488d737126c9ed34f'
            'ba9cd5b593313183ad8c0f008a6edba539063193c416d3893a5344e104a3fff1')
sha256sums_aarch64=('000008e370f4ff058ffb01a9797383cb9b33ff85fe20b0dc46a4abcec1d1fd5c')
sha256sums_x86_64=('a563446a07887ab0b571a0c2884d80a4211fe425a2614333a45e9709bc1825fe')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
