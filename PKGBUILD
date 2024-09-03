# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gql-bin
_pkgname=GQL
pkgver=0.26.0
pkgrel=1
pkgdesc="Git Query language (GQL) is an SQL like language to perform queries on .git files"
url="https://github.com/AmrDeveloper/GQL"
_urlraw="https://raw.githubusercontent.com/AmrDeveloper/GQL/$pkgver"
arch=('x86_64' 'aarch64')
license=('MIT')
conflicts=('gql' 'gitql')
source=("$_urlraw/LICENSE" "$_urlraw/README.md" "$_urlraw/RELEASING.md" "$_urlraw/CONTRIBUTING.md" "$_urlraw/CHANGELOG.md" "$_urlraw/CODE_OF_CONDUCT.md")
source_x86_64=("$url/releases/download/$pkgver/${pkgname%-bin}-$arch-linux.gz")
source_aarch64=("$url/releases/download/$pkgver/${pkgname%-bin}-$arch-linux.gz")
sha256sums=('5c08d88d9194da831dac373045fde39b960a7ed19abd0fc91b82656bde357583'
            '0e3696a45f30e04511fb6774d98a82abc88e2e3edbf493b5d00a2473453f5748'
            'ab676df3728c0813f8d7ad2ddcc07fba94ff0970293a7a6f28bcfaa6b0696e95'
            'af4ac8b60c924c903e093e862bfa490127221ba058713ab6163662cde9312632'
            'a6628e58cc37bf20f3b49c3b5bf11442d91ac04947d871fc8cc740b16cf13785'
            'c8e12f62115ab9962711b84bc396adbf75dfc3c4c7e309b37fed1742567bcb0d')
sha256sums_x86_64=('46bd06d6651d7e6fdbdd260a6e40d9101c8784411f02c4fab3086b9f80be7072')
sha256sums_aarch64=('d742fe1d1ddd8026f6bdfd905389cbb6b81b5933a181418bf2924724b48dd4fc')

package() {
  install -vDm755 $srcdir/${pkgname%-bin}-$arch-linux "$pkgdir/usr/bin/${pkgname%-bin}"
  ln -sf "$pkgdir/usr/bin/${pkgname%-bin}" "$pkgdir/usr/bin/gitql"
  ln -sf "$pkgdir/usr/bin/gitql" "$pkgdir/usr/bin/git-ql"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
