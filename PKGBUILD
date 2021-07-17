# Maintainer: Alejandro Quisbert <alejandropqc@protonmail.com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.0.0
pkgrel=1
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64')
depends=('glibc')
makedepends=('tar')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums=('7d6ef14e8abdb22904fbb3aafa1bbcc8d3b71be48b6ba881d0cf36124c99f396')


package() {

    cd "${srcdir}"
    tar -zxvf $_mongosh_file.tgz
    install -D $_mongosh_file/bin/mongocryptd-mongosh "$pkgdir/usr/bin/mongocryptd-mongosh"
    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"

}