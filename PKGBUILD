# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname=mpv-url
pkgver=1.0.1
pkgrel=3
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
md5sums=('ba5337df26ab7c0af29b47c883f9bf85')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  rsync -a src/ "${pkgdir}/"
}

post_install() {
  update-desktop-database
  xdg-mime default mpv-url.desktop x-scheme-handler/mpv
}

