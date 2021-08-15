# Maintainer: Alejandro Quisbert <alejandropqc@protonmail.com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.0.5
pkgrel=1
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64')
depends=('glibc')
makedepends=('tar')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums=('0e47c60e99dbfb2cc55696a384bd8d23e03df0026ea629e27ceef40e7f0d1770')


package() {

    cd "${srcdir}"
    tar -zxvf $_mongosh_file.tgz
    install -D $_mongosh_file/bin/mongocryptd-mongosh "$pkgdir/usr/bin/mongocryptd-mongosh"
    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"

}
