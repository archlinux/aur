# Maintainer: RubenKelevra <ruben@vfn-nrw.de>

pkgname=netalyzr-cli
pkgver=57861
pkgrel=1
pkgdesc='Debug your internet.'
arch=('any')
url='http://netalyzr.icsi.berkeley.edu/'
license=('custom:netalyzr')
depends=('java-runtime-headless>=8')
source=("netalyzr-cli.jar::http://netalyzr.icsi.berkeley.edu/NetalyzrCLI.jar"
        'netalyzr-cli.starter')
sha512sums=('32e29aef9bd9d0997d9469992f0169e334bc5ab7bb58e30fa320be8925fe57cf2dc9632532f79c1d084c1aad4fb8ff99348bf9cfe7eb6273f17270b0474dcf92'
            '3817f5bdcd4b7978e980caf488aebd9baeed912f46a66ba2ba0cb5480b7be7e539c660935827eba156ce40947ae5bfe85affb7b0603d9ac2e8666658851bf202')

build() {
	cat netalyzr-cli.starter netalyzr-cli.jar > netalyzr-cli && chmod +x netalyzr-cli
	rm netalyzr-cli.starter netalyzr-cli.jar
}
package() {
  install -Dm555 "netalyzr-cli" "$pkgdir/usr/bin/netalyzr-cli"
}
