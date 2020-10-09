# Maintainer: Sivuyile Magutywa <s.magutywa@kernet.co.za>
pkgname=keyboard-led-git
pkgver=0.1
pkgrel=1
pkgdesc="A CLI for turning keyboard scroll lock on and off."
arch=('i686' 'x86_64')
url="https://github.com/Applicafroguy/keyboard-led.git"
license=('MIT')
depends=()
makedepends=(git make)
checkdepends=()
optdepends=(bash)
provides=(keyboardled)
conflicts=()
replaces=()
backup=()
options=()
source=("git+$url")
md5sums=('SKIP')
validpgpkeys=()

package() {
    echo "$srcdir/keyboard-led"
	cd "$srcdir/keyboard-led"
    if [ ${pkgdir}/opt/${pkgname}/keyboardled ]
    then 
        rm -rf "${pkgdir}/opt/${pkgname}/keyboardled"
    fi
    mkdir -p "${pkgdir}/opt/${pkgname}/keyboardled"

    install -Dm755 ./* -t "${pkgdir}/opt/${pkgname}/keyboardled"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 keyboard.sh "${pkgdir}/usr/bin/keyboardled"
}