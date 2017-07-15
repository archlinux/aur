# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=papirus-claws-mail-theme-git
pkgver=20170629
pkgrel=1
pkgdesc="Papirus theme for Claws Mail  (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('LGPL3')
depends=('claws-mail')
makedepends=('git')
conflicts=('papirus-claws-mail-theme' 'claws-mail-papirus-theme' 'claws-mail-papirus-theme-git')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd $pkgname
    install -d $pkgdir/usr/share/claws-mail/themes
    cp -a ./{ePapirus,Papirus{,-{Light,Dark}}} $pkgdir/usr/share/claws-mail/themes/
}
