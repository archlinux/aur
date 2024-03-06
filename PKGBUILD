# Maintainer: Jean-Francois Roy <jf at devklog dot net>

pkgname=kubestr-bin
_pkgname=kubestr
pkgver=0.4.41
pkgrel=1
pkgdesc="Kubestr is a collection of tools to discover, validate and evaluate your kubernetes storage options"
arch=(x86_64 aarch64)
url="https://github.com/kastenhq/kubestr"
license=(Apache-2.0)
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/kubestr_${pkgver}_Linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/kubestr_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('167486d909f25637d964a81d70297af023959be14b90f03c120a4f9566e8786b')
sha256sums_aarch64=('d78d53ba8dd52b3320f18faa4f51c76da43b1d65c4116452aa8a29e64ee44d2d')

noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  mkdir -p "$pkgname-$pkgver"
  tar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kubestr "${pkgdir}/usr/bin/kubestr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
