# Maintainer: IKRadulov <ikradulov@vivaldi.net> 
# Contributors:

_ver=16.10
_gitcom=d6f2a2fae6eb
_pkgbase=mate-hud
pkgname="${_pkgbase}"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Unity like HUD for Mate"
url="https://bitbucket.org/ubuntu-mate/mate-hud.git"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}")
conflicts=("${_pkgbase}" "${_pkgbase}")
license=('GPL')
depends=('appmenu-qt' 'libkeybinder3' 'mate-desktop' 'python' 'python-dbus' 'python-psutil' 'python-setproctitle' 'python-xlib' 'rofi' 'unity-gtk-module')
source=("https://bitbucket.org/ubuntu-mate/mate-hud/get/16.10.0.tar.gz")
sha1sums=('42e774916f021b411c8c39240118c8fb11f8b3a4')

prepare() {
    msg "This will only work if you have UnityForArch repository"
}

package() {
    groups=('mate-extra')
    cd "${srcdir}/ubuntu-mate-mate-hud-${_gitcom}"
    ./setup.py "install" "--root=${pkgdir}" "--optimize=1"
}
