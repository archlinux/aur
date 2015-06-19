# Maintainer: Frantic1048 <dev_frantic1048@163.com>

pkgname=kreogist-mu
pkgver='0.8(unstable)'
pkgrel=7
epoch=0
pkgdesc="Fantastic cross-platform music manager"
changelog="kreogist-mu.changelog"
arch=('x86_64')
url="https://kreogist.github.io/Mu/"
license=('GPL')
depends=(
  'qt5-base'
  'pulseaudio'
  'ffmpeg'
  'phonon-qt5'
  'gst-libav'
  'gstreamer0.10-ffmpeg')
optdepends=(
  'gst-plugins-good: good plugin libraries'
  'gst-plugins-bad: bad plugin libraries'
  'gst-plugins-ugly: ugly plugin libraries'
)
changelog=$pkgname.changelog
source=("https://github.com/frantic1048/mu-archlinux/raw/master/$pkgname-$pkgver.tar.gz")
md5sums=('59ca29c0f5db6f0394ac967975948aff')

package() {
  cd "$pkgname-$pkgver"
  install -d  "${pkgdir}/usr/bin/"
  install -m=775 $pkgname "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
  install -m=664 $pkgname.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
  install -d "${pkgdir}/usr/share/applications/"
  install -m=664 $pkgname.desktop "${pkgdir}/usr/share/applications/"
}
