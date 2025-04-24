# Maintainer: Jah Way <jahway603 at tutanota dot de>

pkgname=peergos
pkgver=1.0.0
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
sha256sums=('7b491ff54e270c37fe7fe0aff691c59ad4d5f458c8bc849196ad8ec77c4e0d5b'
            '37c237b578c5a1828cae720daaf6059e0451c0f9ab618089b9e8b3d972d327a6'
            '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')

# followed guidelines here
# https://wiki.archlinux.org/title/Java_package_guidelines
package() {
  install -Dm755 "${srcdir}/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "${srcdir}/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${srcdir}/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/$pkgname-LICENSE"
  install -Dm644 "${srcdir}/$pkgname-webui-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/$pkgname-webui-LICENSE"
}
