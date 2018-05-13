# Maintainer: Alex Peltzer ("alexpe87") <alexpe.aur@mailbox.org>
# Co-Maintainer: rosatolen <rosatolen@gmail.com>

pkgname=circleci-cli
pkgver=0.0.4705
pkgrel=1
pkgdesc="The circleci commands enable you to reproduce the CircleCI environment locally and run jobs as if they were running on the hosted application"
arch=('x86_64')
url="https://github.com/circleci/local-cli"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/circleci/local-cli/archive/v$pkgver-deba4df.tar.gz"
'https://raw.githubusercontent.com/circleci/local-cli/master/LICENSE')

# CircleCI publishes releases on Amazon AWS according to this documentation:
# https://circleci.com/docs/2.0/local-cli/#installing-the-circleci-local-cli-on-macos-and-linux-distros
# They do not provide other means of verifying their download
md5sums=('SKIP'
'SKIP')

depends=('docker')

build() {
    mv $srcdir/local-cli-$pkgver-deba4df/circleci.sh circleci
}

package() {
    install -Dm644 LICENSE           $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 circleci          $pkgdir/usr/bin/circleci
}
