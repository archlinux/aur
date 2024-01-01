# Maintainer: Marcel Werner <marcel_werner@gmx.de>
# Contributor: Martin Hoppenheit <martin@hoppenheit.info>
pkgname=verso
pkgver=1.2.1
pkgrel=1
pkgdesc="editor for embedded image metadata"
arch=('any')
url="https://martin.hoppenheit.info/code/verso/"
license=('GPL3')
depends=('perl' 'perl-image-exiftool' 'perl-gtk3' 'perl-config-general'
'desktop-file-utils')
source=("https://github.com/marhop/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('7f0449a1c9dd73cc14cd449ee774a989')
sha256sums=('e96da110107a881d106f93999007e0e7b9ff33656efd9c4519c7b31dbe6e0bf4')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
