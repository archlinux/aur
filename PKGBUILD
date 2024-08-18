# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=xmind2latex
pkgver=1.2.0
pkgrel=2
pkgdesc='Tool that reads a XMind mind map and derives a structured latex document.'
arch=('x86_64')
url="https://github.com/arnehaber/$pkgname"
license=('Apache')
depends=('sh' 'java-runtime')
makedepends=()
source=("https://github.com/arnehaber/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.zip")
sha256sums=('9bc5e8562aeebbd2201718e4f555309f34661f09ff2c06608dce73794856cd80')

package() {
    mkdir -p $pkgdir/usr/{bin,lib}

    cp -r "$srcdir/bin" "$srcdir/repo" "$pkgdir/usr/lib"
    rm "$pkgdir/usr/lib/bin/xmind2latex.bat"

    cd "$pkgdir/usr/bin"
    ln -s "../lib/bin/xmind2latex"
}
