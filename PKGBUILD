# Maintainer: Marcel Werner <marcel_werner@gmx.de>
# Contributor: Martin Hoppenheit <martin@hoppenheit.info>
pkgname=verso
pkgver=1.2.0
pkgrel=1
pkgdesc="editor for embedded image metadata"
arch=('any')
url="https://martin.hoppenheit.info/code/verso/"
license=('GPL3')
depends=('perl' 'perl-image-exiftool' 'perl-gtk3' 'perl-config-general'
'desktop-file-utils')
source=("https://github.com/marhop/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2df45224618ecc117c3bd72618ab99ad')
sha256sums=('fd82491fd1ce25029a94d04e160513e1902f720e874b9125984ca3ffa4adc721')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
