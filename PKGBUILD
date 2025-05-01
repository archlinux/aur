# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=yaycache-hook
pkgver=0.1.0
pkgrel=2
pkgdesc="A configurable hook to cleanup the yay package cache using yaycache"
arch=('any')
license=('MIT')
depends=('yaycache')
source=("$pkgname.conf"
        "$pkgname.sh"
        "$pkgname.hook"
        "$pkgname.install"
        "LICENSE")
b2sums=(
        'acc487d6dbd7f2d09fa25c41414245e883879f5b39ef916d4c611c2427f8e05e2124ba8c981ff8e04c61da0dce4aa09e6b5f2b60e6b2317762d0af2f55800fe9'
        'c60bff6bfb4775ee013a475c93d8f0c777bd225a4872b92fb69d54564d7da7657467588070c08b30050270be98ad31c97aac3b39ad235fa941d62e6c386152e5'
        '3e9a1bfd4f6b96665d16618468ef9a6ca3205a808a9412fde06d15ff8b4085cacd6b5b3f0975efbd292c010a5611ba78c314619328d6d87212ac22201d3d9202'
        '097cd5ad2aced63fe2eda2abf315279206177213e9415b978dbc023b3582dddf053ad2ee7c20702c078453c880bba1534324319082fe58665838f3a0eef6d4a9'
        'bb17678dde9a4add0ca67a0cd3673d84a7f550d6bb9dab5a37ef00bd3f26360637d58a393a32124c084560bc61e701ed737117a0d8c3d1ea7f62bd6d7c1de838')
backup=("etc/$pkgname.conf")
install=$pkgname.install

package() {
  install -D -m644 "${srcdir}/$pkgname.hook" "${pkgdir}/usr/share/libalpm/hooks/$pkgname.hook"
  install -D -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/share/libalpm/scripts/$pkgname.sh"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/$pkgname.conf"
  install -D -m644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
