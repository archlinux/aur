# Maintainer: thr <r at sledinmay dot com>
# Contributor: fsckd <fsckdaemon@gmail.com>

pkgname=burg-themes-extras
pkgver=2
pkgrel=4
pkgdesc="Extra Themes for Burg Bootloader"
arch=('any')
url="https://launchpad.net/burg"
license=('GPL')
depends=('burg-bzr')
backup=('boot/burg/gui.cfg' 'boot/burg/burgenv')

source=('http://dl.dropbox.com/u/10014823/burg/168681d1282146464-need-somebody-test-my-burg-theme-fortune-burg-v03.tar.gz'
        'http://dl.dropbox.com/u/10014823/burg/Autumn-Refined.tar.gz'
        'https://www.ppload.com/api/files/download?id=1465382471'
        'http://dl.dropbox.com/u/10014823/burg/minimal_burg_theme_by_sir_nimaj-d2xhk79.zip'
        'https://www.ppload.com/api/files/download?id=1465390934'
       )
sha256sums=('b6cc96fdb58bffebb11e28fd52b1555486323cfacc6a5153258986825dfdc391' # fortune
            '03bc0adc8fc1d3a62116b0ec6a43738373ea2898f40ed8a7a0860fc6b40a019b' # autumn
            '8a8762d355f2ecbd9162f9dbddaebf6036f75c4b1b3be27fc947863b002b1aa7' # vitruvio
            'c8bad6bda48213bae318847f3b0c615b709cb3d2835cd10332b18dbcde29fb1d' # minimal
            '6347ddd5d3ed92cc6a4c756add85286fbbb3abd6aae70dd82aaa01d228977cf1' # radianceblack
           )
install='burg-themes.install'

package() {
  mkdir -p "${pkgdir}/boot/burg/themes"
  # install fortune
  cp -rip "${srcdir}/fortune" "${pkgdir}/boot/burg/themes"
  install -Dm644 "${srcdir}/README.txt" "${pkgdir}/boot/burg/themes/fortune"
  # install autumn
  cp -rip "${srcdir}/Autumn-Refined" "${pkgdir}/boot/burg/themes"
  # install vitruvio
  mv "${srcdir}/download?id=1465382471" "${srcdir}/vitruvio.tar.gz"
  cp -rip "${srcdir}/vitruvio" "${pkgdir}/boot/burg/themes"
  # install minimal
  cp -rip "${srcdir}/minimal" "${pkgdir}/boot/burg/themes"
  # install radianceblack
  mv "${srcdir}/download?id=1465390934" "${srcdir}/radianceblack.tar.gz"
  cp -rip "${srcdir}/radianceblack" "${pkgdir}/boot/burg/themes"
}

# http://gnome-look.org/content/show.php/Fortune+-+BURG+Theme?content=128929
# http://gnome-look.org/content/show.php/Autumn+Refined+Burg+Theme?content=126556
# http://gnome-look.org/content/show.php/vitruvio+for+grub2+with+burg?content=124143
# http://gnome-look.org/content/show.php/Minimal+BURG+Theme?content=129446
# http://gnome-look.org/content/show.php/Radiance+for+Burg+(Black+Edition+Mod)?content=126560

# eof
