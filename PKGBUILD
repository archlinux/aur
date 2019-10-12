# Maintainer: Pig Monkey <pm@pig-monkey.com>
_pkgname=paperbackup
pkgname=$_pkgname-git
pkgrel=1
pkgver=r27.7c3f064
pkgdesc="Create a pdf with barcodes to backup text files on paper. Designed to backup ASCII-armored GnuPG and SSH key files and ciphertext."
arch=('any')
depends=('python' 'python-pillow' 'python-pyx' 'python-qrencode' 'enscript' 'ghostscript' 'zbar')
license=('MIT')
url='https://github.com/intra2net/paperbackup'
source=('git+https://github.com/intra2net/paperbackup')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 paperbackup.py "${pkgdir}/usr/bin/paperbackup.py"
    install -Dm755 paperrestore.sh "${pkgdir}/usr/bin/paperrestore.sh"
    install -Dm755 paperbackup-verify.sh "${pkgdir}/usr/bin/paperbackup-verify.sh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
