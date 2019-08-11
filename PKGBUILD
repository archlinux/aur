# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=bananapkg-git
pkgver=2.2.4.8
pkgrel=1
pkgdesc="Low-level package manager written in shell bash"
url="https://bananapkg.github.io"
license=('MIT')
arch=('any')
source=('git+https://github.com/slackjeff/bananapkg.git')
md5sums=('SKIP')
depends=(
    'bash>=4.4.18'
    'sed'
    'tar'
    'awk'
    'xz>=5.2.2'
    'gnupg>=2.2.9'
)

provides=('banana')
conflicts=('banana')

package() {
    cd bananapkg
    ./install.sh DESTDIR="${pkgdir}"

    # change directory
    install -Dm755 "${pkgdir}/sbin/banana" "${pkgdir}/usr/bin/banana"
    rm -rf "${pkgdir}/sbin"
}
