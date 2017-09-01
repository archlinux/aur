# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ccat
pkgver=1.1.0
pkgrel=2
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('CUSTOM')
makedepends=('go' 'git')
conflicts=('ccat-git' 'ccrypt')
options=('!strip' '!emptydirs')
source=("https://github.com/jingweno/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('9ce544810476685c4b7f1220b9e99649')


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
