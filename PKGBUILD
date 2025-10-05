# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

pkgname=gql-bin
_pkgname=${pkgname%-bin}
_pkgbinary=gitql
pkgver=0.41.0
pkgrel=1
pkgdesc="Git Query language (GQL) is an SQL like language to perform queries on .git files"
url="https://github.com/AmrDeveloper/GQL"
_urlraw="https://raw.githubusercontent.com/AmrDeveloper/GQL/$pkgver"
arch=('x86_64' 'aarch64')
license=('MIT')
conflicts=("${_pkgbinary}" "${_pkgname}")
source=("LICENSE_${pkgver}::$_urlraw/LICENSE"
        "README_${pkgver}::$_urlraw/README.md"
        "RELEASING_${pkgver}::$_urlraw/RELEASING.md"
        "CONTRIBUTING_${pkgver}::$_urlraw/CONTRIBUTING.md"
        "CHANGELOG_${pkgver}::$_urlraw/CHANGELOG.md"
        "CODE_OF_CONDUCT_${pkgver}::$_urlraw/CODE_OF_CONDUCT.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.gz::$url/releases/download/${pkgver}/${_pkgname}-${arch[0]}-linux.gz")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.gz::$url/releases/download/${pkgver}/${_pkgname}-${arch[1]}-linux.gz")
sha256sums=('538a5a5e065de1fe693ebf72cf3c0c69656d4438663ff4aefbd59a4a63bc683f'
            '54db543e154bb141ec97966aa8add22a23910af719b3557b8040e8940e94844f'
            'ab676df3728c0813f8d7ad2ddcc07fba94ff0970293a7a6f28bcfaa6b0696e95'
            'af4ac8b60c924c903e093e862bfa490127221ba058713ab6163662cde9312632'
            '661e3da6a27e84ac6c7ce31b8d704acb2d8f9d96c636c6ccdcf8d27aae5fecad'
            'c8e12f62115ab9962711b84bc396adbf75dfc3c4c7e309b37fed1742567bcb0d')
sha256sums_x86_64=('e5ef7f41c84086923244be578a09f49158b926045bfc3e213097c24e8eba286e')
sha256sums_aarch64=('79026d1b06a8ecbbfddce7447a632a959b482a812385be1a6d4c688cc298078a')

package() {
  install -vDm755 "$srcdir/${_pkgname}_${pkgver}_${arch}" "$pkgdir/usr/bin/${_pkgbinary}"
  ln -rsf "$pkgdir/usr/bin/${_pkgbinary}" "$pkgdir/usr/bin/${_pkgname}"

  install -vDm644 "LICENSE_${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm644 "RELEASING_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/RELEASING.md"
  install -vDm644 "CONTRIBUTING_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -vDm644 "CHANGELOG_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -vDm644 "CODE_OF_CONDUCT_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CODE_OF_CONDUCT.md"
}
