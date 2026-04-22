# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>
# Contributor: XONIDU

pkgname=xonimail
pkgver=1.0
pkgrel=1
pkgdesc="Cliente de Gmail para terminal optimizado para equipos de bajos recursos"
arch=('any')
url="https://github.com/XONIDU/xonimail"
license=('MIT')
depends=('python')
makedepends=('git')
source=("$pkgname::git+https://github.com/XONIDU/xonimail.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    
    # Instalar programa principal
    install -Dm755 start.py "$pkgdir/usr/bin/xonimail"
    install -Dm755 xonimail.py "$pkgdir/usr/share/$pkgname/xonimail.py"
    
    # Instalar documentacion
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 requisitos.txt "$pkgdir/usr/share/doc/$pkgname/requisitos.txt"
}

post_install() {
    echo ""
    echo "XONIMAIL instalado correctamente"
    echo ""
    echo "Para configurar tu token de Gmail:"
    echo "  mkdir -p ~/.xonimail"
    echo "  nano ~/.xonimail/token.txt"
    echo ""
    echo "Para ejecutar:"
    echo "  xonimail"
    echo ""
    echo "Obtener token: https://myaccount.google.com/apppasswords"
    echo ""
}
