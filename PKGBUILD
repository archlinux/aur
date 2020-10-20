pkgname='hastebin-git'
pkgver=1.2.0
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
    sh "./scripts/get_version.sh"
}

package()
{
    cd "${pkgname%-git}"
    install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}

