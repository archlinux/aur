# Maintainer: Ariez <ariez@ariez.gay>
pkgname=ariez
pkgver=2.0
pkgrel=1
pkgdesc="aids"
arch=('x86_64')
url="https://ariez.codes"
license=('MIT')
depends=('gcc') # Add any dependencies here if required

source=(
  "https://cdn.discordapp.com/attachments/1134301212292948018/1134351272640782448/plooshra1n.c"
  "https://cdn.discordapp.com/attachments/1134301212292948018/1134347173337763881/LICENSE"
)
sha256sums=('6fd41d68b20a73e6be7aca0933357c5abffa9ad7dfbf7ae207ee14f8f6aa88be'
            '81a0d868f205580ee865a755e2bae4f2cb78f31f3b90dc24649200be8f44d9f5')

build() {
  cd "$srcdir"
    gcc -Wl,-z,relro,-z,now plooshra1n.c -o ariez
}

package() {
  cd "$srcdir"
  sudo install -Dm755 ariez "/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sudo chmod +x /usr/bin/ariez
}

# Run the following command to generate the SHA256 hash of the source archive:
# sha256sum plooshra1n.c
# Replace 'plooshra1n.c' with the actual name of your source file.
