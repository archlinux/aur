# Maintainer: tarball <bootctl@gmail.com>

pkgname=vtsls
pkgver=0.1.20
pkgrel=2
pkgdesc='LSP wrapper for the TypeScript extension from Visual Studio Code'
url='https://github.com/yioneko/vtsls'
license=(MIT)
arch=(any)
depends=(nodejs)
makedepends=(npm)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@vtsls/language-server/-/language-server-$pkgver.tgz"
        LICENSE)
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('fe7d05db68aff984285471e14dd3c657d0c8ab2fd2fcb016bd089bceee865250'
            '9bb7826149a1b0c343eeec81e74375c5d840af39016af5d41a49d71b0342b3d4')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
