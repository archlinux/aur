# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.0
_pkgver=${pkgver}
pkgrel=2
pkgdesc="Another file list program that supports multiple storage"
arch=('x86_64')
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
source=("$_pkgname-$pkgver.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-amd64.tar.gz"
        "alist.service")
sha256sums=("c52d35bd04ae6a99763979f290e2124e448809701530a53450d2e48f3e98d21b"
            "4fe3bea4a6a0fd67e89dfaf7dd273754f9b93e22f70d5aae41789e2cf20b1cc6")

package() {
    install -Dm755 alist-linux-amd64 ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
}
