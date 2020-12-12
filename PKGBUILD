# Maintainer: sircipherz <sircipherz@mail.com>
pkgname=the-joi-database
pkgver=0.0.3.5
pkgrel=1
pkgdesc="An adult game made for JOI's lovers"
url="http://www.the-joi-database.com"
license=('Unlicense')
arch=('x86_64')
depends=("unzip")

source=(
    "http://www.the-joi-database.com/downloads.php?version=game_versions/The%20joi%20Database%20${pkgver}-linux.zip&file_id=65&id=36"
    "https://pastebin.com/raw/nQ6vZAyJ"
)
noextract=(
    "The%20joi%20Database%20${pkgver}-linux.zip&file_id=65&id=36"
)
sha256sums=(
    '37658a3aca7eb060d8fcd2fdd8fc5b6a828e4723c119daf1e9826ac332eb07d8'
    '63e6e0d917635d93fe0c540f1e996971d1271031bbc695b8a05ce7f33657a82e'
)

prepare() {
    cd "${srcdir}"
    rm -rf Asis_Story_Hub
    unzip --qq "The%20joi%20Database%20${pkgver}-linux.zip&file_id=65&id=36"
}

package() {
    cd "${srcdir}"
    install -Ddm 755 Asis_Story_Hub /opt/TheJoiDatabase/
    install -Dm 755 nQ6vZAyJ $pkgdir/usr/share/applications/jdb.desktop
}
