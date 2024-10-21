# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=unshell
pkgver=0.10.0
pkgrel=1
pkgdesc='A utility for splitting input into shell-like tokens'
url='https://codeberg.org/coralpink/unshell'
arch=('any')
license=('custom:MIT+NIGGER')
source=(
    "$pkgname.tar.gz::https://codeberg.org/coralpink/unshell/archive/$pkgver.tar.gz"
    "$pkgname.tar.gz.sig::https://codeberg.org/coralpink/unshell/releases/download/$pkgver/$pkgver.tar.gz.sig"
)
sha256sums=(
    'da6a4c25d77b0be88f7201d75de810d4c1ec3ca19c3bf190cabaee23841680a2'
    '8ce7cae80b621ba6e859bb8405266a2301f4e50916fb7434ada3e9ca157792ac'
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr PACKAGE_NAME="$pkgname" install
}

