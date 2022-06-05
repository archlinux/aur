# Maintainer: Alejandro Quisbert <alejandropqc at protonmail dot com>
# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.5.0
pkgrel=1
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64' 'aarch64')
depends=('krb5')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source_x86_64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums_x86_64=('722786542d67019b8a2843ccad665bd0aaf2292acd880ddeddb1e5ef489bf303')
source_aarch64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-arm64.tgz")
sha256sums_aarch64=('54ac5bc71a657a87a34ac573820382c83188a902c93bca8d2e203754ea2e81cd')

package() {
    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"
    install -D $_mongosh_file/bin/mongosh_crypt_v1.so "$pkgdir/usr/lib/mongosh_crypt_v1.so"
    install -Dm644 $_mongosh_file/mongosh.1.gz "$pkgdir/usr/share/man/man1/mongosh.1.gz" 
}
