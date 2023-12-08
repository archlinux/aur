# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=vipshell
pkgver=1.2.5
pkgrel=1
pkgdesc="VIP Shell is a cutting-edge, open-source terminal environment that elevates your command-line experience with enhanced features and personalized interactions."
arch=('x86_64')
url="https://github.com/NymexData/C-VipNX"
license=('MIT')
depends=('gcc')
source=("https://github.com/NymexData/C-VipNX/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('b342e8b04bc8915c03c6ee3e4dada27a09b1eb6749b7d74cb028903f89c1e3b7')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  # cp "$srcdir"/vipshell.c "$srcdir"/C-VipNX-v."$pkgver"/
}
build() {
  cd "$srcdir"/C-VipNX-v."${pkgver}"
  gcc -o vipshell "$srcdir"/C-VipNX-v."${pkgver}"/vipshell.c
}
package() {
  install -Dm755 "$srcdir"/C-VipNX-v."${pkgver}"/vipshell "${pkgdir}/usr/local/bin/vipshell"

}
