# Maintainer: Emilia <gasd228337@gmail.com>

pkgname=python-cia-descrypter-git
pkgver=0.1
pkgrel=2
pkgdesc="A Python script to decrypt Nintendo 3DS .cia files using pyctr"
arch=('any')
url="https://github.com/Emilia228x/cia-descrypter"
license=('LGPL-2.1-only')

depends=('python' 'python-pyctr')
makedepends=()

# Стандартный auto-tarball от GitHub
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b72784ff2bc8701172b30c96929d8e468a19cdf7dcfa8662f9ff359421be8145')

package() {
    # GitHub создаёт папку {repo}-{tag}, т.е. cia-descrypter-0.1
    cd "$srcdir/cia-descrypter-$pkgver"

    install -Dm755 decrypt_cia.py "$pkgdir/usr/bin/decrypt-cia"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
