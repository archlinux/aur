# Maintainer: Berk Kapla <berkkapla82@proton.me>

pkgname=kdownload-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Blazing-fast async segmented file downloader (binary release)"
arch=('x86_64')
url="https://github.com/compiledkernel-idk/kdownload"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('kdownload')
conflicts=('kdownload')
_releasetag="1.2"
source=("kdownload-${pkgver}::https://github.com/compiledkernel-idk/kdownload/releases/download/${_releasetag}/kdownload-x86_64-linux"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/compiledkernel-idk/kdownload/v${pkgver}/LICENSE"
        "README-${pkgver}.md::https://raw.githubusercontent.com/compiledkernel-idk/kdownload/v${pkgver}/README.md")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "$srcdir/kdownload-${pkgver}" "$pkgdir/usr/bin/kdownload"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
