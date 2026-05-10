# Maintainer: BigBrainRobin29 @ GitHub
pkgname=deepl-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="DeepL CLI is a comprehensive, developer-friendly command-line tool that integrates DeepL's powerful Translate, Write, and Voice APIs."
arch=(any)
url="https://github.com/DeepLcom/deepl-cli/"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('python3')
provides=("deepl")
conflicts=("deepl")
source=("deepl-cli-$pkgver.tar.gz::https://github.com/DeepLcom/deepl-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c8e824960084d1bb33f6b0741a31ea5fc5c3b49525e4ddf6e325e77aab9e58a2')

build() {
	cd "$srcdir"/deepl-cli-$pkgver/
    npm install
    npm run build
}

package() {
    cd "$srcdir"/deepl-cli-$pkgver/
    npm install --global --install-links --prefix "$pkgdir"/usr
}
