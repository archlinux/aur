# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=3.16.0
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "x86_64")
url="https://github.com/alist-org/alist"
license=('AGPL3')
provides=(${_pkgname})
backup=("etc/alist/config.json")
optdepends=('aria2: download by aria2.')
source=("alist.service" "config.json" "alist.sysusers" "alist.tmpfiles")
install=alist.install
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-amd64.tar.gz")
sha256sums=('5712b21aebf669fe9fb5d47dd685809d4d9670b1bb1d5e6fef962b9d11ba9d72'
            'b72f194a7b8855e97eeb76e63e179f38132cc9e6be9daa5b396699c9c11611de'
            '3658370660806f73c3d9bc5f1b6e2a013c9520d34ffc4462df99f7692473613d'
            'c6b62c4a750ab921c2e8f965e4baeee28855c9a969b00eddd346670f2fdf12de')
sha256sums_aarch64=('8e9f2482e376fb2d12c6c3f00e8ba4da9f971f7fcebd5f701c2d70b03fc194ae')
sha256sums_x86_64=('501bd074794bae7e2c0c25d665c52b385e973e5e6019b910434a075fb4f3446a')

package() {
    install -Dm755 alist ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
    install -Dm644 alist.sysusers ${pkgdir}/usr/lib/sysusers.d/alist.conf
    install -Dm644 alist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/alist.conf
}
