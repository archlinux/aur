pkgname=lumus
pkgver=1.0.1
pkgrel=1
pkgdesc="A command line tool to read PDF files directly in the terminal"
arch=('x86_64')
url="https://github.com/Josehpequeno/lumus"
license=('MIT')
depends=('poppler' 'wv' 'unrtf' 'tidy' 'tesseract' 'leptonica' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Josehpequeno/lumus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
    # Comandos para construir o seu projeto, por exemplo:
    go build -o $pkgname
}

package() {
    # Criar diretório de instalação
    mkdir -p "$pkgdir/usr/bin"

    # Copiar o executável lumus para o diretório de instalação
    cp "$pkgname" "$pkgdir/usr/bin/"
    # Instalar o executável construído
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}