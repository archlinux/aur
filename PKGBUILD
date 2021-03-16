# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=kopia-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.8.0~beta2
_pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=3
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kopia/kopia/'
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$pkgname-${_pkgver}.tar.gz::https://github.com/kopia/kopia/releases/download/v${_pkgver}/${pkgname%-bin}-${_pkgver}-linux-x64.tar.gz")
source_aarch64=("$pkgname-${_pkgver}.tar.gz::https://github.com/kopia/kopia/releases/download/v${_pkgver}/${pkgname%-bin}-${_pkgver}-linux-arm64.tar.gz")
source_armv7h=("$pkgname-${_pkgver}.tar.gz::https://github.com/kopia/kopia/releases/download/v${_pkgver}/${pkgname%-bin}-${_pkgver}-linux-arm.tar.gz")
sha256sums_x86_64=('a41c2cf59b5244c3bccab4856d339d705b7dc2aa162d7524eb3fd7eb3f5561c3')
sha256sums_aarch64=('a17ac9bc904e7520da0afe76b9a671c32cfabcb120cca53282b68a4a2a648f89')
sha256sums_armv7h=('d4709a851dfac66f0c3d04eb20e1a02a3ed8f652d01d87ef097529a8bfda6e7a')
noextract=("$pkgname-${_pkgver}.tar.gz")

prepare() {
    mkdir -p "${pkgname%-bin}"
    bsdtar -xf "$pkgname-${_pkgver}.tar.gz" -C "${pkgname%-bin}" --strip-components	1
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/${pkgname%-bin}/${pkgname%-bin}" "$pkgdir/usr/bin/"
}
