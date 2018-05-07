# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-mailnag-applet
pkgver=0.1.0+1+90824cd
pkgrel=1
pkgdesc="Mailnag applet for Budgie Desktop"
url='https://github.com/ilgarmehmetali/budgie-mailnag-applet'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('budgie-desktop' 'json-glib' 'mailnag' 'libpeas')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')

_commit="90824cd4025c624c2fba0e7b20fc98c6de3bcc75"
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha512sums=(SKIP)

build() {
  cd "$srcdir/${pkgname}"
  mkdir -p build
  cd "${srcdir}/${pkgname}/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" ninja install
}
