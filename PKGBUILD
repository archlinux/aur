pkgname=shrike-keys
pkgver=1.0.1
pkgrel=1
pkgdesc="A GTK3 GUI tool to generate and manage PGP and SSH keys"
arch=('x86_64')
url="https://codeberg.org/root1/Shrike-Linux-Uganda"
license=('MIT')
depends=('gtk3' 'gnupg' 'openssh')
makedepends=('gcc' 'pkg-config')
source=("shrike_keys.c" "key.svg" "upload.svg" "ssh.svg" "list.svg" "sign.svg" "fingerprint.svg" "delete.svg" "lock.svg" "shrike-keys.desktop")
md5sums=('4544210e9e412f4a2707a76e5b2bff5c'
         'ac2a2af40420a3e82ae4209d6897b647'
         'd48b8d464ba259fc78fa4c3d9136f2e7'
         '39fd39cacfbf663d2abfc88e48a57879'
         '3172565253735c9bd88dbb26cd4e8a94'
         '0310b44810ee6035721a266b08f7a20c'
         'e27e5fdb334348bfca6cce4022ab4b54'
         '75fd7eec6c1f6d986e83fdcd7f147585'
         'ed049a64aa31e2a2d54f17af34811019'
         '812131e20e56d462708189e57f6a05c0')

build() {
  gcc shrike_keys.c -o shrike-keys -DDATADIR='"/usr/share/shrike-keys"' $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  install -Dm755 shrike-keys "$pkgdir/usr/bin/shrike-keys"
  install -Dm644 key.svg "$pkgdir/usr/share/shrike-keys/key.svg"
  install -Dm644 upload.svg "$pkgdir/usr/share/shrike-keys/upload.svg"
  install -Dm644 ssh.svg "$pkgdir/usr/share/shrike-keys/ssh.svg"
  install -Dm644 list.svg "$pkgdir/usr/share/shrike-keys/list.svg"
  install -Dm644 sign.svg "$pkgdir/usr/share/shrike-keys/sign.svg"
  install -Dm644 fingerprint.svg "$pkgdir/usr/share/shrike-keys/fingerprint.svg"
  install -Dm644 delete.svg "$pkgdir/usr/share/shrike-keys/delete.svg"
  install -Dm644 lock.svg "$pkgdir/usr/share/shrike-keys/lock.svg"
  install -Dm644 shrike-keys.desktop "$pkgdir/usr/share/applications/shrike-keys.desktop"
}
