# Maintainer: Jah Way <jahway603 at tutanota dot de>

pkgname=peergos
pkgver=1.11.0
pkgrel=1
pkgdesc="A p2p, secure file storage, social network and application protocol"
url="https://github.com/Peergos/web-ui"
arch=('x86_64')
license=('AGPL-3.0-only')
depends=('java-environment>=21'
         'java-environment-openjdk>=21') # have to specify java 21 or greater
noextract=("$pkgname-$pkgver.jar")
source=("$pkgname-$pkgver.jar::$url/releases/download/v$pkgver/Peergos.jar"
        "$pkgname.sh"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/Peergos/Peergos/master/Licence.txt"
        "$pkgname-webui-LICENSE::https://raw.githubusercontent.com/Peergos/web-ui/master/LICENSE")
sha512sums=('850866b674b3fe213aa0ab5fe23e1c4f8dd239fb73a9d2ec2ced262b8c2788231143c6ae22085bcbbc9b8be1d37d4c225979ba6677fe335c124522738b84ed94'
            'cc143f55631eb372d622c058f97a084d7f374df28ce316b16c1ee9c95cb9cfcd763e929cd51ceb1e29fbf7e646c46b1627c13fc284513d665840da648917c247'
            'a0a86214ea153fb07ff35ceec0848dd1703eae22de036a825efc8394e50f65e3044832f3b49cf7e45a39edc470bdf738abc36a3a78ca7df3a6e73c14eaef94a8'
            '552aec8d120c9d931769f6a6b794716fce978d0055715de21746dc0f064f4a0f72b6be42d4828b98a56715b23fa427c1f66fd20aca0ef1751cc384c420db1605')

# followed guidelines here
# https://wiki.archlinux.org/title/Java_package_guidelines
package() {
  install -Dm755 "${srcdir}/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "${srcdir}/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${srcdir}/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/$pkgname-LICENSE"
  install -Dm644 "${srcdir}/$pkgname-webui-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/$pkgname-webui-LICENSE"
}
