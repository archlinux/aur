# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname=mpv-url
pkgver=1.0.0
pkgrel=2
pkgdesc="Handle mpv:// URLs and open them using mpv."
arch=('any')
url="https://github.com/fa7ad/${pkgname}"
license=('BSD-3-Clause')
depends=(
  'bash'
  'mpv'
  'desktop-file-utils'
  'xdg-utils'
  'rsync'
)
source=("https://github.com/fa7ad/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('446ab34c79d54b2d9925b7c0b0af6702')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  rsync -a src/ "${pkgdir}/"
}

post_install() {
  update-desktop-database
  xdg-mime default mpv-url.desktop x-scheme-handler/mpv
}

