# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.0_beta.0
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "x86_64")
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
backup=("etc/alist/config.json")
source=("alist.service" "config.json")
install=alist.install
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-amd64.tar.gz")
sha256sums=('cfc884eb88806ec74fec205a29fcd617a418a706110915c93b4d034dca85fb36'
            '8b6b667eabcf4912c4f1292b61d31bc0da864177c559221b96dc04178e8ce693')
sha256sums_aarch64=('54a1ae6db2dcc7718356ac3f6beb9c420d34658801cf06d4665d88d461583aa3')
sha256sums_x86_64=('61bdaa72ee22acee4095dcb1dcdb7028d39fcce44e7438f31e274ae4a8db3424')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
