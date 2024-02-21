# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=upd8all
pkgver=0.0.2
pkgrel=1
pkgdesc="Upd8All: Simplify package updates on Arch Linux with one command. Supports Pacman, Yay, and Homebrew."
arch=('x86_64')
url="https://github.com/felipealfonsog/Upd8All"
license=('BSD 3-Clause')
depends=('gcc' 'python3')
source=("https://github.com/felipealfonsog/Upd8All/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('b3c4442d3b021dda161ca3342fc78a892d084bb9e5ceee0076feb5f3ef3a052e')

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


