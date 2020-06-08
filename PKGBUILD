# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ventoy-bin
pkgver=1.0.12
pkgrel=2
pkgdesc='A new multiboot USB solution (Binary)'
url='http://www.ventoy.net/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('bash' 'util-linux')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
        'ventoy')
sha512sums=('b89c4de490ec7af8358c98c7613ba2cb91e42c2db0c7e541ac62e1b3d9dfb7ff2d7550c72a71e52b0e27f7b030053e62b1b3bde3ed93fe7b00be78d4abe00865'
            '27fef4c8e254863896888cf3e77a39ed377100effc69a4518fe55038069c7c1e8b56f1a79d47d969eda8e5bd90920e93b34dd361aac67be948266d1e7b238dcd')

package() {
  cd "${pkgname%-bin}-${pkgver}"

  install -Dm644 boot/* -t "$pkgdir/opt/${pkgname%-bin}/boot/"
  install -Dm644 "${pkgname%-bin}"/* -t "$pkgdir/opt/${pkgname%-bin}/${pkgname%-bin}/"
  install -Dm755 tool/* -t "$pkgdir/opt/${pkgname%-bin}/tool/"
  install -Dm755 *.sh -t "$pkgdir/opt/${pkgname%-bin}/"

  install -Dm755 "$srcdir/${pkgname%-bin}" -t "$pkgdir"/usr/bin/
}
