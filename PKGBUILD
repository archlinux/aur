# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=ascetic-experiences
pkgdesc="Ascetic Experiences Reader and Translation app from russian to georgian"
pkgver=v0.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/pumenis/ascetic-experiences"
license=('MIT')
depends=('ankor' 'gowebgtkit' 'treadlate')
makedepends=('git' 'sqlite')
source=("git+https://github.com/pumenis/ascetic-experiences.git#tag=v0.0.1")
sha256sums=('1a72aee6531818f33188cee8724291b37b4e9c952b52dc27af55c0a96e03ea30')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags
}

package() {
    cd "$srcdir/$pkgname"
    sqlite3 database/ascetic-experiences.sqlite3 <sql/ascetic-experiences.sqlite3.sql 
    sqlite3 database/ascetic-experiences.SQLite3 <sql/ascetic-experiences.SQLite3.sql 

    install -d ${pkgdir}/usr/share/treadlate/database/
    install -d ${pkgdir}/usr/share/applications/
    install -d ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
    cp -r icons/* ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
    cp -r shortcuts/* ${pkgdir}/usr/share/applications/
    cp -r database/* ${pkgdir}/usr/share/treadlate/database/
}
