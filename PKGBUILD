#Maintainer Robosky <fangyuhao0612@gmail.com>
pkgname=avengers-gtk-theme-git
_pkgname=Avengers-gtk-theme
pkgdesc='A special version of Qogir gtk theme'
pkgver=8.f91984c
pkgrel=1
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
source=('Install.patch'
        'git+https://github.com/vinceliuice/Avengers-gtk-theme.git')
url='https://github.com/vinceliuice/Avengers-gtk-theme'
md5sums=('SKIP'
         'SKIP')
makedepends=('git' 'patch')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
build() {
    cd "${srcdir}/${_pkgname}"
    patch Install < "${srcdir}/Install.patch"
}
package() {
    cd "${srcdir}/${_pkgname}"
    install -m755 -d "${pkgdir}/usr/share/themes"
    DEST_DIR="${pkgdir}/usr/share/themes" ./Install
}

