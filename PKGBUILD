# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=yaycache-hook
pkgver=0.2.0
pkgrel=1
pkgdesc="A configurable hook to cleanup the yay package cache using yaycache"
arch=('any')
license=('MIT')
depends=('yaycache')
source=("$pkgname.conf"
        "$pkgname.sh"
        "$pkgname.hook"
        "$pkgname.install"
        "LICENSE")
b2sums=('704b848a634ce96b760c6285028a2e6b6760fd145dbda7aad79dc8b31a2658332df22d4f4f7b882c8f85cc0c797834066ad5a0d81114765cfa8e9f0ced3deb18'
        '616134408b8fbccf5ec951b80b9d3b93a603686ebe76ed0e7eb1c56a09e0b2c42cf40861277229c55ceea718ef4edf296ece5c314779dce48091e6225cba7d5e'
        '3e9a1bfd4f6b96665d16618468ef9a6ca3205a808a9412fde06d15ff8b4085cacd6b5b3f0975efbd292c010a5611ba78c314619328d6d87212ac22201d3d9202'
        '317b8620cc81156197007c0c402e2f171e3cba2eb459a57bc1a4c8013c185e883847cc1eb9f7493ead2645dea35c828df9aab0158bd7d3bc2d2949f811b4464e'
        'bb17678dde9a4add0ca67a0cd3673d84a7f550d6bb9dab5a37ef00bd3f26360637d58a393a32124c084560bc61e701ed737117a0d8c3d1ea7f62bd6d7c1de838')
backup=("etc/$pkgname.conf")
install=$pkgname.install

package() {
  install -D -m644 "${srcdir}/$pkgname.hook" "${pkgdir}/usr/share/libalpm/hooks/$pkgname.hook"
  install -D -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/share/libalpm/scripts/$pkgname.sh"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/$pkgname.conf"
  install -D -m644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
