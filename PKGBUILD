# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=upd8all
pkgver=0.0.1
pkgrel=1
pkgdesc="Upd8All: Simplify package updates on Arch Linux with one command. Supports Pacman, Yay, and Homebrew."
arch=('x86_64')
url="https://github.com/felipealfonsog/Upd8All"
license=('BSD 3-Clause')
depends=('gcc' 'python3')
source=("https://github.com/felipealfonsog/Upd8All/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('158d4ae7412badbfeb687c866014ebac544882f28a61cb13010f2f81c3196ba9')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  # cp "$srcdir"/upd8all-wrp.c "$srcdir"/Upd8All-v."$pkgver"/src/
}
build() {
  cd "$srcdir"/Upd8All-v."${pkgver}"
  gcc -o upd8all-wrp "$srcdir"/Upd8All-v."${pkgver}"/src/upd8all-wrp.c
}
package() {
  install -Dm755 "$srcdir"/Upd8All-v."${pkgver}"/src/upd8all-wrp "${pkgdir}/usr/local/bin/upd8all"
  install -Dm755 "$srcdir"/Upd8All-v."${pkgver}"/src/upd8all_updater.py "${pkgdir}/usr/local/bin/upd8all.py"
}


