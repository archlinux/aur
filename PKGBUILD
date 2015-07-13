# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ccat
pkgver=1.0.0
pkgrel=1
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('CUSTOM')
makedepends=('go' 'git')
conflicts=('ccat-git')
options=('!strip' '!emptydirs')
source=("https://github.com/jingweno/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2bc1f3aa7d3b9764cfb3c0aa0270392c')


build() {
  cd "$srcdir/$pkgname-$pkgver/"
  msg2 'Building ccat'
  ./script/build

}


package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/

}
