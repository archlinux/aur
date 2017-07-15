# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=papirus-filezilla-themes-git
pkgver=20170310
pkgrel=2
pkgdesc="Papirus theme for Filezilla (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('LGPL3')
depends=('filezilla')
makedepends=('git')
conflicts=('papirus-filezilla-theme' 'filezilla-papirus-theme' 'filezilla-papirus-theme-git')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd $pkgname
    install -d $pkgdir/usr/share/filezilla/resources
    cp -a ./{epapirus,papirus,papirus-dark} $pkgdir/usr/share/filezilla/resources/
}
