pkgname='sprunge-git'
pkgver=0.4.r0.gca54f95
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
conflicts=("${pkgname%-git}")
optdepends=('xclip: default --clip-command')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
    cd "${pkgname%-git}"
    install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}

