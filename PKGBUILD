# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=clonepkg
pkgver=0.2.0
pkgrel=1
pkgdesc="Clones AUR packages with Git"
arch=('any')
depends=('git')
url="https://github.com/atweiden/clonepkg"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('41d8f144dc935aebc49b3b17110ef1962a054e26501533d71348db8e41a05ce3')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -Dm 755 clonepkg -t "$pkgdir/usr/bin"
}
