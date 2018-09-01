# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>
# Contributor: Andrew Ayer <agwa@andrewayer.name>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: noirbizarre <noirbizarre@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=git-crypt-git
pkgver=0.6.0_0_g546664f
pkgrel=2
_branch=master
pkgdesc="Transparent file encryption in Git"
arch=('x86_64')
url="https://www.agwa.name/projects/${pkgname%-git}/"
license=('GPL3')
makedepends=('git' 'libxslt')
depends=('git' 'openssl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/AGWA/${pkgname%-git}.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/-/_/g'
}

build() {
    cd "${pkgname%-git}"

    make ENABLE_MAN=yes PREFIX=/usr
}

package() {
    cd "${pkgname%-git}"

    make ENABLE_MAN=yes PREFIX=/usr DESTDIR="$pkgdir" install
}
