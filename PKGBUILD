# Maintainer: Yamada Hayao <hayao@fascode.net>
_extname='activities-icons'
_uuid="activities_icons@fawtytoo"

pkgname="gnome-shell-extension-${_extname}-git"
pkgver=r6.f29ee60
pkgrel=1
pkgdesc="A Gnome Shell extension that replaces the Activities button with 2 icons for selecting between Applications and Workspaces."
arch=('x86_64' 'i686')
url="https://github.com/fawtytoo/activities-icons"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')

source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${_extname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

    cd "${srcdir}/${_extname}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -dpr --no-preserve=ownership * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
