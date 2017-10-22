# Maintainer: Fredrik Strandin <fredrik at strandin dot name>
pkgname=emoji-keyboard
pkgver=2.2.0
pkgrel=2
pkgdesc="Virtual keyboard-like emoji picker for linux"
arch=('i686' 'x86_64')
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
license=('GPL3')
depends=('python' 'python-gobject' 'libappindicator-gtk3' 'python-evdev')
source=("https://github.com/OzymandiasTheGreat/${pkgname}/archive/${pkgver}.tar.gz"
        "fix_svg_path.patch")
sha256sums=('39e4e9edb1d3f75a73f4161289a4586d77a8b4c0c9743437e7239e5976ea157c'
            '2bb58538962ff65fa60152e45891faf5b7ccb531e87b05753162f365483b68a3')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/fix_svg_path.patch"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
