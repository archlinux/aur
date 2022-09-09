# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.0_beta.0
pkgrel=5
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
sha256sums=('f9f6152b0329946809778efd2396496363212dd2fb1fe465a049a54ab9d5a5f2'
            'bbae12ab423ddd9b6cf98d7b7ba3f1e0ea59cc2d556f19a781b5e09a9168be84')
sha256sums_aarch64=('25a5b044545b7cbde3c308d6033b6758c2657fa46201c2341efa25b3455c78bd')
sha256sums_x86_64=('557586fc1b97a752fed61965eb694840948582a3e7226bf0604074fd4ccbc952')

package() {
    install -Dm755 alist ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
