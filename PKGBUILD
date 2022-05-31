# Maintainer: Alejandro Quisbert <alejandropqc at protonmail dot com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.4.2
pkgrel=2
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64' 'aarch64')
depends=('krb5')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source_x86_64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums_x86_64=('bf2e1939ce5cf012ffc4e4acf81ee4d53f79bd44646be44ef676ce3579814fb2')
source_aarch64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-arm64.tgz")
sha256sums_aarch64=('4b8736251aa9f09ca64831ae911c1d4fca22b84fe7a1f1fd02acb48706da29be')

package() {

    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"
    install -D $_mongosh_file/bin/mongosh_csfle_v1.so "$pkgdir/usr/lib/mongosh_csfle_v1.so"
    install -Dm644 $_mongosh_file/mongosh.1.gz "$pkgdir/usr/share/man/man1/mongosh.1.gz" 

}
