# Maintainer: Ashutosh Tripathi pushpatripathi1111@gmail.com
pkgname=encrypt-decrypt-pyqt5
pkgdesc="A solution for encrypting and decrypting files built with PyQt5"
pkgver=1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/stupid-kid-af/Encrypt-Decrypt-PyQt5"
license=('MIT')
provides=(encd)
depends=('zlib' 'glibc')
makedepends=('git')
install=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd Encrypt-Decrypt-PyQt5
	pyinstaller --onefile --windowed application.py
}
package() {
	cd Encrypt-Decrypt-PyQt5
        cd dist
        mv application "$pkgname"
        install -Dm755 ./"$pkgname" "$pkgdir/usr/bin/$pkgname"

}
