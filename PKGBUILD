#Author: Andrey Leonchikov <andreil499@gmail.com>
#Maintainer: Ilya Chelyadin <ilya77105@gmail.com>

pkgname=nice-boat
pkgver=1.0.1.7503
pkgrel=1

source=(
         "https://cloud.kokokoshka.com/s/FiprpDLgHT5EWEn/download"
         "SchoolDays.desktop"
         "ShinyDays.desktop"
         "unpack_school.sh"
         "unpack_shiny.sh")
md5sums=(
         'SKIP'
         'c515095d4236a9090332ab5afada3326'
         'aae45fc657f09f033bb9a2b1a8cdb9fa'
         '121f2bc12e5ff51c3579c9ba54e8a0e8'
         'ceafb860d9752a7deaf6ef30cd7fc6e1')
pkgdesc="Fan-made game engine for 0verflow games (School Days, Shiny Days)"
url="https://cloud.kokokoshka.com/s/FiprpDLgHT5EWEn"
arch=(x86_64)
license=(GPL)
depends=(glibc libjpeg-turbo libpng freetype2 ffmpeg libvorbis libogg curl openssl zlib openal libglvnd glu libx11 gcc-libs)
optdepends=(
         'innoextract: for fast resources unpack without wine, used in unpack script'
         'grep: used in unpack script'
         'sed: used in unpack script')
package() {
    cd "$srcdir"
    install -Dm644 SchoolDays.desktop "$pkgdir/usr/share/applications/SchoolDays.desktop"
    install -Dm644 ShinyDays.desktop "$pkgdir/usr/share/applications/ShinyDays.desktop"
    install -Dm775 unpack_school.sh "$pkgdir/opt/SchoolDays/unpack.sh"
    install -Dm775 unpack_shiny.sh "$pkgdir/opt/ShinyDays/unpack.sh"
    cd "$srcdir/nice-boat"
    install -Dm644 school_days.png "$pkgdir/opt/SchoolDays/school_days.png"
    install -Dm644 shiny_days.png "$pkgdir/opt/ShinyDays/shiny_days.png"
    install -Dm775 nice_boat "$pkgdir/opt/SchoolDays/nice_boat"
    install -Dm775 nice_boat "$pkgdir/opt/ShinyDays/nice_boat"

    echo "#################################################################"
    echo "Please, download game resources, install innoextract package and use unpack script!"
    echo "Visit https://rutracker.org/forum/viewtopic.php?t=5141773 for School Days"
    echo "and https://rutracker.org/forum/viewtopic.php?t=5009974 for Shiny Days"
    echo "Script usage:"
    echo "cd /your/path/SchoolDaysHQ or cd /your/path/ShinyDaysHQ"
    echo "run /opt/SchoolDays/unpack.sh or /opt/ShinyDaysHQ/unpack.sh as root"
    echo "#################################################################"
}
