# Maintainer: Alejandro Quisbert <alejandropqc at protonmail dot com>
# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.10.6
pkgrel=1
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64' 'aarch64')
depends=('krb5')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_folder=mongosh-${pkgver}-linux

source_x86_64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums_x86_64=('eba55b549510301f2f8f1c12184173b8ef82fea464c8b1f2449fb7517dd12fd6')
source_aarch64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-arm64.tgz")
sha256sums_aarch64=('badbd7057b9fc207fb6a2bc926913fd1254932fb4740d746dc518da421e9117a')

package() {
		if [ $CARCH = 'x86_64' ]; then
		  _arch=x64;
		elif [ $CARCH = 'aarch64' ]; then
		 _arch=arm64;
		fi
    install -D $_mongosh_folder-${_arch}/bin/mongosh "$pkgdir/usr/bin/mongosh"
    install -D $_mongosh_folder-${_arch}/bin/mongosh_crypt_v1.so "$pkgdir/usr/lib/mongosh_crypt_v1.so"
    install -Dm644 $_mongosh_folder-${_arch}/mongosh.1.gz "$pkgdir/usr/share/man/man1/mongosh.1.gz" 
}
