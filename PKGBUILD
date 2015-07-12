# Maintainer: aksr <aksr at t-com dot me>
pkgname=dviasm-git
pkgver=20150412.r2.gcc03d91
pkgrel=1
epoch=
pkgdesc="A TeX utility program for editing DVI files directly."
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=('python2')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('dviasm')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/khaledhosny/dviasm"
        'http://tug.org/TUGboat/Articles/tb28-2/tb89cho.pdf'
        'http://ajt.ktug.kr/assets/2008/5/1/0201cho.pdf')
noextract=()
md5sums=('SKIP'
         '702f49e7eaaebe4ed4e445399c6d56e0'
         '86b75c9b11e95c5158b60d8ba8a5c631')
sha1sums=('SKIP'
          '6be6a8b35d183b27c0ab86d30fd0ff1dcaa98c77'
          '8545152b546eccaae344b10e1605468b223a66a4')
sha256sums=('SKIP'
            'acbbc433c70be092359182e1d2ea8c24e47eacf46c7c6da4981902d1fcd6cf78'
            'ca59060b7f74e82330d371ca06d8e9cd17ca7962fb303c53c33f1b2da270a833')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 dviasm.py $pkgdir/usr/bin/dviasm
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 $srcdir/tb89cho.pdf $pkgdir/usr/share/doc/$pkgname/tb89cho.pdf
  install -Dm644 $srcdir/0201cho.pdf $pkgdir/usr/share/doc/$pkgname/0201cho.pdf
}

