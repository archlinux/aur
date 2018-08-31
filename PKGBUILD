# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

pkgname=yaics
pkgver=0.6
pkgrel=1
pkgdesc="A simple GNU social client developed in Qt"
arch=('i686' 'x86_64')
conflicts=('yaics-git')
url="https://gitlab.com/stigatle/yaics/"
license=('GPL')
depends=('qt5-base' 'aspell' 'hicolor-icon-theme')
source=("${pkgname}::git+https://gitlab.com/stigatle/yaics.git#commit=eb921d1415843f2a88c2a73d5f9278b0d978caf4")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  qmake yaics.pro
  make
}

package() {
  cd "${pkgname}"

  # Bin file
  install -Dm755 yaics \
    "${pkgdir}/usr/bin/yaics"

  # Desktop file
  install -Dm644 yaics.desktop \
    "${pkgdir}/usr/share/applications/yaics.desktop"

  # XML file
  install -Dm644 yaics.appdata.xml \
    "${pkgdir}/usr/share/appdata/yaics.appdata.xml"

  # Icons
  install -Dm644 icons/16x16/yaics.png \
    "${pkgdir}/usr/share/icons/hicolor/16x16/apps/yaics.png"
  install -Dm644 icons/32x32/yaics.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/yaics.png"
  install -Dm644 icons/48x48/yaics.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/yaics.png"
  install -Dm644 icons/64x64/yaics.png \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/yaics.png"
  install -Dm644 icons/80x80/yaics.png \
    "${pkgdir}/usr/share/icons/hicolor/80x80/apps/yaics.png"
  install -Dm644 icons/yaics.xpm \
    "${pkgdir}/usr/share/pixmaps/yaics.xpm"

  # Translations
  install -d "${pkgdir}/usr/share/yaics/translations"
  install -Dm644 translations/* \
    "${pkgdir}/usr/share/${pkgname}/translations"

  # Doc files
  install -Dm644 ChangeLog \
    "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm644 AUTHORS \
    "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"

  # Man files
  install -Dm644 docs/yaics.1 \
    "${pkgdir}/usr/share/man/man1/yaics.1"

  # License
  install -Dm644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:
