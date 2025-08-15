# Maintainer: liyp <my [at] liyp dot cc>
pkgname=mtoc  
pkgver=2.1.1
pkgrel=1
pkgdesc="Music player and library browsing application"  
arch=('x86_64')  
url="https://github.com/asa-degroff/mtoc"  
license=('GPL3')  
depends=('qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-svg'
         'taglib' 'gstreamer')
makedepends=('cmake' 'qt6-tools' 'pkgconf' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/asa-degroff/mtoc/archive/refs/tags/mtoc-$pkgver-$pkgrel.tar.gz")  
sha256sums=('00ddb6e4513304ccfdeacf52195dba4ca961e46b8a30e1ce926d8e13485b547d')
  
build() {  
    cd "$pkgname-$pkgname-$pkgver-$pkgrel"  
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr  
    cmake --build build  
}  
  
package() {  
    #cd "$pkgname-$pkgver"  
    cd "$pkgname-$pkgname-$pkgver-$pkgrel"  
    DESTDIR="$pkgdir" cmake --install build  
      

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"  
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"  
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"  
}
