# Maintainer: Вячеслав Зубик

pkgname=zvvradio-git
_pkgname=zvvradio
gitver=git
pkgver=3.1.$gitver
_pkgver=2
pkgrel=1.4
pkgdesc="radio player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('python-pyqt5' 'vlc') 
conflicts=('zvvradio')
source=("git+https://github.com/ZVVUbuntu/zvvradio.git" "zvvradio_start" "Radio.desktop" "radio1.png")
md5sums=('SKIP'
         '3999c98e30d2457d6c46423c4762a902'
         '2a5a58f675b613214851e1641896d2fe'
         '567603600e476e1be7173edda218c14d')

package() {
  cd "${srcdir}"
  install -d $pkgdir/usr/share/zvvradio
  install -Dm755 zvvradio_start $pkgdir/usr/bin/zvvradio
  install -Dm755 Radio.desktop $pkgdir/usr/share/applications/ZVVRadio.desktop
  install -Dm755 radio1.png $pkgdir/usr/share/icons/hicolor/scalable/apps/zvvradio.png
  install -Dm755 radio1.png $pkgdir/usr/share/pixmaps/zvvradio.png
  cp -r zvvradio $pkgdir/usr/share/
}
