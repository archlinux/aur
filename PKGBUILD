# Fork of the AUR awesome-gnome package
# Maintainer: Claire Farron <diesal3@googlemail.com>
# Original maintainers of the awesome-gnome package -
# Maintainer: Rainux Luo <rainux@gmail.com>
# Contributor: Daniel Wallace <daniel.wallace12@gmail.com>

pkgname=awesome-cinnamon
pkgver=0.1
pkgrel='4'
pkgdesc='Launch awesome with cinnamon-settings-daemon'
arch=('any')
url='https://github.com/clfarron4/archlinux-awesome-cinnamon/'
license=('CCPL')
depends=('awesome' 'cinnamon>=2.0' 'notification-daemon')
conflicts=('awesome-gnome')
install=awesome-cinnamon.install
source=($pkgname.desktop
        awesome.desktop
        awesome.session)
md5sums=('42803aa2f97cec2bb68ca3ea4324dc2a'
         '871ecdef3228176b42e9e455c63e942f'
         '918dc0803431c8248b2b40849be20cbc')

package() {
    cd $srcdir
    install -Dm644 $srcdir/${source[2]} $pkgdir/usr/share/cinnamon-session/sessions/${source[2]}
    install -Dm644 $srcdir/${source[1]} $pkgdir/usr/share/applications/${source[1]}
    install -Dm644 $srcdir/${source[0]} $pkgdir/usr/share/xsessions/${source[0]}
}

# vim:set sts=2 ts=2 sw=2 et:
