# Maintainer: eclairevoyant
_npm_user=wenyan
_npm_pkg=cli
pkgname=nodejs-$_npm_user-$_npm_pkg
pkgver=0.3.4
pkgrel=1
pkgdesc="文言文編程語言。A programming language for the ancient Chinese. Command-line compiler"
arch=('any')
url="https://github.com/wenyan-lang/wenyan"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
_filename=$_npm_pkg-$pkgver.tgz
source=("https://registry.npmjs.org/@$_npm_user/$_npm_pkg/-/$_filename")
sha256sums=('84ef489c9831f8014c4b2f40fc263a57d6b3c2259a10c0e0ef3213fe9cf9ae42')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
