# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mastodon
pkgver=1.1.1
pkgrel=0.1
pkgdesc="A GNU Social-compatible microblogging server"
arch=('i686' 'x86_64')
url="https://mastodon.social"
license=('AGPL-3.0')
conflicts=("${pkgname}-git" "${pkgname}-docker" "${pkgname}-docker-git")
source=("https://github.com/tootsuite/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e5b394a764710facb5830b7fad54a714aa08920017e6ecd02145bcbf70c5cded')
_user=mastodon
_homedir="/var/lib/${pkgname}"
_shell="/bin/false"

post_install() {
    getent group ${_user} > /dev/null || groupadd ${_user} > /dev/null
    getent passwd ${_user} > /dev/null || useradd -d ${_homedir} -g ${_user} -s ${_shell} ${_user} > /dev/null
}
