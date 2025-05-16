# Maintainer: Pedro Lucas <pedrolucasinvestidor62023@gmail.com>
pkgname=adivinha_numero
pkgver=0.0.1 # Ajuste para a versão do seu software
pkgrel=1
pkgdesc="Um jogo simples de adivinhar o número escrito em Rust." # Uma descrição melhor
arch=('any')
url="https://github.com/pedrodev2025/jogo-de-adivinhacao-rust.git" # Substitua pela URL do seu projeto
license=('MIT') # Substitua pela licença correta
depends=() # Se o seu executável Rust for estaticamente linkado, pode não ter dependências
makedepends=('rust' 'cargo')
source=("jogo-de-adivinhacao-rust-Lan-amento.tar.gz::https://github.com/pedrodev2025/jogo-de-adivinhacao-rust/archive/refs/tags/Lan%C3%A7amento.tar.gz") # Arquivo fonte
sha256sums=('8b588885c59143a27daec629912990b7e545631968eac2289dd339aada0260d2') # Calcule o hash SHA256 do seu arquivo fonte

build() {
  cd "${srcdir}/jogo-de-adivinhacao-rust-Lan-amento"
  echo "Diretório de build atual:"
  pwd
  echo "Listando conteúdo do diretório:"
  ls -l
  cargo build --release
  echo "Listando conteúdo do diretório target/release após o build:"
  ls -l target/release
}
package() {
  install -Dm755 "${srcdir}/jogo-de-adivinhacao-rust-Lan-amento/target/release/adivinha_numero" "${pkgdir}/usr/games/adivinha_numero"
}
