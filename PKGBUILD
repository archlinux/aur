# Maintainer: Ariez <ariez@ariez.gay>
pkgname=ariez
pkgver=1.0
pkgrel=1
pkgdesc="aids"
arch=('x86_64')
url="https://ariez.codes"
license=('MIT')
depends=('gcc') # Add any dependencies here if required

source=(
  "https://cdn.discordapp.com/attachments/1120155748849156136/1134343169643913226/plooshra1n.c"
  "https://cdn.discordapp.com/attachments/1134301212292948018/1134347173337763881/LICENSE"
)
sha256sums=(
  '322c4aec58769a46f7a119776628eeae313d627be7e81c7ded91a4198c39e0d0'
  '81a0d868f205580ee865a755e2bae4f2cb78f31f3b90dc24649200be8f44d9f5'
)

build() {
  cd "$srcdir"
    gcc -Wl,-z,relro,-z,now plooshra1n.c -o ariez
}

package() {
  cd "$srcdir"
  install -Dm755 ariez "$pkgdir/usr/bin/ariez"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Run the following command to generate the SHA256 hash of the source archive:
# sha256sum plooshra1n.c
# Replace 'plooshra1n.c' with the actual name of your source file.
