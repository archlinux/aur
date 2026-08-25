# Maintainer: Marcel Werner <marcel_werner@gmx.de>
# Contributor: Martin Hoppenheit <martin@hoppenheit.info>
pkgname=verso
pkgver=1.3.0
pkgrel=1
pkgdesc="editor for embedded image metadata"
arch=('any')
url="https://martin.hoppenheit.info/code/verso/"
license=('GPL3')
depends=('perl' 'perl-image-exiftool' 'perl-gtk3' 'perl-config-general')
source=("https://github.com/marhop/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('0d145b655e2d45d12a2d10dc7523e570')
sha256sums=('35f6962a260f88165843c58ce51f61d94cc249c2eb13f10b8168ecb4bca6b600')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
