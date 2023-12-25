# Maintainer: taotieren <admin@taotieren.com>

pkgbase=github520-git
pkgname=github520-git
pkgver=r4
pkgrel=1
pkgdesc="😘 让你“爱”上 GitHub，解决访问时图裂、加载慢的问题。"
arch=(any)
url="https://github.com/521xueweihan/GitHub520"
license=('CC BY-NC-ND 4.0 DEED')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(systemd)
makedepends=(git
    wget
    sed)
checkdepends=()
optdepends=()
source=(update-github520-hosts.service
    update-github520-hosts.timer)
install=github520-git.install
sha256sums=('b48be3e31639d8fa2e565ff72ddf0413d8efe9b033b03187c67b36e09b63b10f'
            '2f35458ba93c2c233dfaf291e77ea6042e634b5575dcd69c6a98bed9a48b8569')
options=('!strip')

# pkgver() {
#     cd "${srcdir}/${pkgname}/"
#     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
# }

package() {
    install -Dm0644 ${srcdir}/update-github520-hosts.* -t ${pkgdir}/usr/lib/systemd/system/
}

