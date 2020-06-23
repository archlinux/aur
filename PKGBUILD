# Maintainer: Jacob A. Tice <jacob.a.tice@gmail.com>

pkgname=aptpik
pkgver=1.0
pkgrel=1
pkgdesc="a pikaur wrapper with syntax from debian's apt"
arch=('any')
url="https://github.com/daemonspudguy/aptpik"
license=('WTFPL')
depends=('sudo' 'pikaur')
makedepends=('git')
source=("${url}/releases//download/${pkgver}/v${pkgver}.zip")
md5sums=('SKIP')
_gitname='aptpik'
conflicts=('apt' 'apt-git' 'aptpac-git' 'aptpac')


package() {
        cd "${_gitname}-v${pkgver}" &&
        install -m 755 -D aptpik "${pkgdir}/usr/bin/aptpik"
        cd "${pkgdir}/usr/bin/"
        ln -s "aptpik" "apt"
        ln -s "aptpik" "apt-get"
}
