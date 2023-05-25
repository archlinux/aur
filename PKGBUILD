# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=nodejs-csso-cli
pkgver=4.0.2
pkgrel=1
pkgdesc="Command line interface for CSSO"
arch=('any')
url="https://github.com/css/csso-cli"
license=('MIT')
depends=('nodejs' 'nodejs-csso')
makedepends=('npm' 'nodejs-csso')
source=("https://registry.npmjs.org/csso-cli/-/csso-cli-$pkgver.tgz")
sha256sums=('db9af38095d32992af58a27015d3b53cc2e3e27ba0fc0ed3d8d75fb527ac9f3d')

package() {
    npm install -g --prefix "$pkgdir"/usr --cache "${srcdir}/npm-cache" "$srcdir"/csso-cli-$pkgver.tgz

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
