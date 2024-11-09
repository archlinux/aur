# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gql-bin
_pkgname=${pkgname%-bin}
pkgver=0.30.0
pkgrel=1
pkgdesc="Git Query language (GQL) is an SQL like language to perform queries on .git files"
url="https://github.com/AmrDeveloper/GQL"
_urlraw="https://raw.githubusercontent.com/AmrDeveloper/GQL/$pkgver"
arch=('x86_64' 'aarch64')
license=('MIT')
conflicts=('gql' 'gitql')
source=("LICENSE_${pkgver}::$_urlraw/LICENSE"
        "README_${pkgver}::$_urlraw/README.md"
        "RELEASING_${pkgver}::$_urlraw/RELEASING.md"
        "CONTRIBUTING_${pkgver}::$_urlraw/CONTRIBUTING.md"
        "CHANGELOG_${pkgver}::$_urlraw/CHANGELOG.md"
        "CODE_OF_CONDUCT_${pkgver}::$_urlraw/CODE_OF_CONDUCT.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.gz::$url/releases/download/${pkgver}/${_pkgname}-x86_64-linux.gz")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.gz::$url/releases/download/${pkgver}/${_pkgname}-aarch64-linux.gz")
sha256sums=('5c08d88d9194da831dac373045fde39b960a7ed19abd0fc91b82656bde357583'
            '5b041b448a3980e87095997935bb574ca863c896e1041b4f34ce44db88473a10'
            'ab676df3728c0813f8d7ad2ddcc07fba94ff0970293a7a6f28bcfaa6b0696e95'
            'af4ac8b60c924c903e093e862bfa490127221ba058713ab6163662cde9312632'
            'f4082304266653cee638ea46ec0fdb125d4513be2c2659289132b391f610893d'
            'c8e12f62115ab9962711b84bc396adbf75dfc3c4c7e309b37fed1742567bcb0d')
sha256sums_x86_64=('4be14f9093e794c0d6e2c096e8c11658e741edf1ca344ec5dd90b0b454237c0f')
sha256sums_aarch64=('5c057d57b76023f1a55f2ae8c199c956de7b01b768809e5ffb39312ce4fa48f0')

package() {
  install -vDm755 "$srcdir/${_pkgname}_${pkgver}_${arch}" "$pkgdir/usr/bin/${_pkgname}"
  ln -sf "$pkgdir/usr/bin/${_pkgname}" "$pkgdir/usr/bin/gitql"
  ln -sf "$pkgdir/usr/bin/gitql" "$pkgdir/usr/bin/git-ql"

  install -vDm644 "LICENSE_${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm644 "RELEASING_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/RELEASING.md"
  install -vDm644 "CONTRIBUTING_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -vDm644 "CHANGELOG_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -vDm644 "CODE_OF_CONDUCT_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CODE_OF_CONDUCT.md"
}
