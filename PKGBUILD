# Maintainer: Martin Hoppenheit <martin@hoppenheit.info>
pkgname=verso
pkgver=1.0.0
pkgrel=1
pkgdesc="editor for embedded image metadata"
arch=('any')
url="https://martin.hoppenheit.info/code/verso/"
license=('GPL3')
depends=('perl' 'perl-image-exiftool' 'perl-gtk3' 'perl-config-general'
'desktop-file-utils')
source=("https://github.com/marhop/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e570baef3c02e6fea3c7b47896bd7c1d')
sha256sums=('b8ed2c5412c83acf3cd641c57100a50b1eb3ef2b0784c2c8464b01b2297f7bff')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
