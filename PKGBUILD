# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>
pkgname=libreoffice-codehighlighter2
pkgver=2.8.1
pkgrel=1
pkgdesc="Code Highlighter 2 – syntax highlighting extension for LibreOffice"
arch=('any')
url="https://gitlab.com/jmzambon/libreoffice-codehighlighter2"
license=('GPL3')
groups=('libreoffice-extensions')
depends=('libreoffice' 'python' 'python-pygments')
source=("codehighlighter2-${pkgver}.oxt::https://gitlab.com/jmzambon/libreoffice-codehighlighter2/-/raw/v${pkgver}/codehighlighter2.oxt?inline=false")
noextract=("codehighlighter2-${pkgver}.oxt")
sha256sums=('f6ecb26a45e7f768b502ea9d6875e74e923c159034e29f5760da0063da690258')

package() {
  local dest="${pkgdir}/usr/lib/libreoffice/share/extensions/codehighlighter2"
  install -d "$dest"
  # .oxt is a zip; unpack as a bundled (shared) extension
  bsdtar -xf "${srcdir}/codehighlighter2-${pkgver}.oxt" -C "$dest"
}
