# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-desktop-settings
pkgver=0.0.11
pkgrel=1
pkgdesc="Lynx Desktop Settings - Basic Configuration"
arch=('any')
url="https://gitlab.com/LynxOS/$pkgname"
license=('GPL')
makedepends=('git')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('11bd10c6fdc7a1a60bdde7c3a9cc5b77')
depends=(
        'dex'
        'qt5-styleplugins'
        'dunst'
        'qt5ct'
        'polkit-gnome'
        'lynx-menu-data'
        'lynx-gtk-theme'
        'openbox'
        'python-yaml'
	'picom'
        )

package() {
    cd $_pkgbase
    install -dm755 $pkgdir/etc
    install -dm755 $pkgdir/usr/share/glib-2.0/schemas
    install -dm755 $pkgdir/etc/lynx
    cp $srcdir/$pkgname-$pkgver/etc/lynx/session.yaml $pkgdir/etc/lynx/session.yaml
    cp -r $srcdir/$pkgname-$pkgver/etc/skel $pkgdir/etc
    cp -r $srcdir/$pkgname-$pkgver/usr $pkgdir/
    chmod a+x $pkgdir/usr/bin/lynx-session
    cp $srcdir/$pkgname-$pkgver/schemas/* $pkgdir/usr/share/glib-2.0/schemas
}
