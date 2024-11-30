# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gql-bin
_pkgname=${pkgname%-bin}
pkgver=0.32.0
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
            '0c2e2d9a95de5ff4f6e9833c052855162d9974b72a00336eb16ec81a845ca245'
            'ab676df3728c0813f8d7ad2ddcc07fba94ff0970293a7a6f28bcfaa6b0696e95'
            'af4ac8b60c924c903e093e862bfa490127221ba058713ab6163662cde9312632'
            '39b5d0280e9cc11a11b6290498996b5dc75044a5d1992cc3b144400cb05f29db'
            'c8e12f62115ab9962711b84bc396adbf75dfc3c4c7e309b37fed1742567bcb0d')
sha256sums_x86_64=('c5fe917ea110a4d2233a4643b5b3fa5d4e616dc6597d2264bc0fe5f163060d66')
sha256sums_aarch64=('d6b0b3d3db7deb4b5d9e7b12a7f0d02fd3e6a8edc59c0ab3606dc91cf14b6444')

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
