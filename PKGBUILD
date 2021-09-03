pkgname='hastebin-git'
pkgver=1.2.r0.gb50e403
pkgrel=1
pkgdesc='Upload data to hastebin via stdin'
license=('GPL2')
url='https://github.com/kevr/hastebin'
arch=('any')
depends=('python' 'python-requests')
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

