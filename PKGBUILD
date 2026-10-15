pkgname=pagefind-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Static low-bandwidth search at scale"
url="https://pagefind.app/"
license=("MIT")
arch=('x86_64' 'aarch64')

source=("$pkgname-$pkgver.tar.gz::https://github.com/pagefind/pagefind/archive/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/pagefind/pagefind/releases/download/v${pkgver}/pagefind_extended-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/pagefind/pagefind/releases/download/v${pkgver}/pagefind_extended-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums=('b2562714098479a19ddade7ad226ddbb9ecee8663a51963018ada9101ef16f34')
sha256sums_x86_64=('aeb135927856e7a49816cf2c9c2e53167f87afa1f61f7288b7d66c234a950d38')
sha256sums_aarch64=('3f667f37fb6c03006212cea2a28cd26c0b47eb797c1113cad716dfff712ff19d')

package() {
  install -Dm755 pagefind_extended "${pkgdir}/usr/bin/pagefind"

  cd "${srcdir}/pagefind-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/pagefind"

  install -Dm644 LICENSE "${pkgdir}/usr/share/pagefind/"
}
