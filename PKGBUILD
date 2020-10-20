pkgname='sprunge-git'
pkgver=0.3.1
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
conflicts=("${pkgname%-git}")
optdepends=('xclip: default --clip-command')
source=("git+${url}")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname%-git}"
    git pull origin master --tags --no-rebase
}

pkgver() {
    cd "${pkgname%-git}"
    sh "./scripts/get_version.sh"
}

package()
{
    cd "${pkgname%-git}"
    install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}

