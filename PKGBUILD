# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=nodejs-csso-cli
pkgver=3.0.0
pkgrel=3
pkgdesc="Command line interface for CSSO"
arch=('any')
url="https://github.com/css/csso-cli"
license=('MIT')
depends=('nodejs' 'nodejs-csso')
makedepends=('npm' 'nodejs-csso')
source=("https://registry.npmjs.org/csso-cli/-/csso-cli-$pkgver.tgz")
sha256sums=('dc4a516ef7184a5b3c26daef0f90b2c0ea9e280119fcc97b4ce925e34ff21adc')

package() {
    npm install -g --prefix "$pkgdir"/usr --cache "${srcdir}/npm-cache" "$srcdir"/csso-cli-$pkgver.tgz

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
