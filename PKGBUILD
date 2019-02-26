# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: yinflying <yinflying@foxmail.com>
pkgname=mendeleydesktop-bundled-fcitx
pkgver=1.19.3
pkgrel=1
pkgdesc="mendeleydesktop fcitx input method support"
arch=('x86_64')
url="http://yinflying.top/2017/09/727"
license=('GPL')
depends=('mendeleydesktop-bundled')
makedepends=('git')  # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("https://github.com/yinflying/BlogSource/raw/master/lib-fcitx-plugin/arch-qt5.10.1/libFcitxQt5DBusAddons.so.1.0"
        "https://github.com/yinflying/BlogSource/raw/master/lib-fcitx-plugin/arch-qt5.10.1/libfcitxplatforminputcontextplugin.so")
noextract=()
md5sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/libfcitxplatforminputcontextplugin.so" "$pkgdir/opt/mendeleydesktop/lib/mendeleydesktop/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so"
    install -Dm755 "$srcdir/libFcitxQt5DBusAddons.so.1.0" "$pkgdir/opt/mendeleydesktop/lib/qt/libFcitxQt5DBusAddons.so.1.0"
    cd "$pkgdir/opt/mendeleydesktop/lib/qt"
    ln -s libFcitxQt5DBusAddons.so.1.0 libFcitxQt5DBusAddons.so.1
    ln -s libFcitxQt5DBusAddons.so.1 libFcitxQt5DBusAddons.so
}
