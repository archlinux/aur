# Maintainer: Jack Random <jack ät random.to>
# previous maintainer: Michael J. Pento <mjpento@verizon.net>
# previous maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20190605
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/download/id/1559729670/s/${_hash_time[0]}/t/${_hash_time[1]}/lt/download/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/download/id/1559728977/s/${_hash_time[0]}/t/${_hash_time[1]}/lt/download/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/download/id/1559729711/s/${_hash_time[0]}/t/${_hash_time[1]}/lt/download/Matcha-aliz.tar.xz"
       )

sha256sums=('4099b09e80c7df60de0a99862903c1082e1ae7cc726a89916316f8b5f55f6347'
            'a2cd4048e495a1bf7d7277f2deedca1bb3fa7d33c7ca46ad282859399e30a070'
            '928e0e4b0caee0e9d158353fe962bdc89949e0a06b46f458aeec30c2d6a678e9'
           )

package() {
   find Matcha{,-dark}-{sea,azul,aliz}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha{,-dark}-{sea,azul,aliz}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}
