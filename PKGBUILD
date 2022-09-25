# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.2
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "x86_64")
url="https://github.com/alist-org/alist"
license=('AGPL3')
provides=(${_pkgname})
backup=("etc/alist/config.json")
source=("alist.service" "config.json")
optdepends=('aria2: download by aria2.')
install=alist.install
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-amd64.tar.gz")
sha256sums=('f9f6152b0329946809778efd2396496363212dd2fb1fe465a049a54ab9d5a5f2'
            'b72f194a7b8855e97eeb76e63e179f38132cc9e6be9daa5b396699c9c11611de')
sha256sums_aarch64=('407182c02b3c7bedc24b128964a1fd6ba089c21c4834c0f147c5eebeaae14778')
sha256sums_x86_64=('b7d341df80f6d4ff7b129701b1d9fea3535374d67738b9eb359912d03d79fb71')

package() {
    install -Dm755 alist ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
}
