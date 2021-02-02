# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=hosts-add-github-git
_repo=hosts_add_github
pkgver=r7.73a920d
pkgrel=1
pkgdesc="Adding GitHub IPs from GitHub520 to hosts"
arch=('any')
url="https://github.com/chenyanzz/hosts_add_github"
license=('unknown')
makedepends=('git')
depends=('python-requests')
optdepends=()
provides=('hosts-add-github')
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/$_repo
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/$_repo
    install -d ${pkgdir}/usr/bin
    install -m755 update_gh_hosts.py ${pkgdir}/usr/bin/update-gh-hosts
}