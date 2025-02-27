# Maintainer: Omansh Krishn omansh@duck.com

pkgname=bloomeetunes-bin
_pkgname=bloomeetunes
_ver=2.11.1
pkgver=${_ver}+165
_relver=${_ver}_dev+44
pkgrel=1
pkgdesc='Bloomee is a cross-platform music app designed to bring you ad-free tunes from various sources.'
arch=('x86_64')
url='https://github.com/HemantKArya/BloomeeTunes'
license=('GPL2')
depends=('gtk3' 'pango' 'harfbuzz' 'at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'gcc-libs')
provides=('bloomeetunes')
conflicts=('bloomeetunes-git')
options=(!debug)


source=("https://github.com/HemantKArya/BloomeeTunes/releases/download/v${pkgver}/bloomee_tunes_linux_v${_relver}.zip"
        "${_pkgname}.desktop")

sha512sums=('b7d07598766d0e662e2e954643add514c217ea96d960d394220ab60658c7209c3bc02740dffdd303cd74e3add6f46147605ec214f9469134674a42c6f2662e5a'
            'bfd5f754fe1a87f23872520a1c15e4dea3482bbaa81d4edc408e9a474ebd28faaff6e70cc79e36e5ee0598f36bdf60a657ee8fe39b9b243832542f8e9532db7e')

package() {
  install -dm755 "${pkgdir}/opt"
  install -dm755 "${pkgdir}/usr/share/applications"

  install -Dm755 "${srcdir}/bloomee" "${pkgdir}/opt/bloomeetunes/bloomee"
  cp --preserve=mode -r "${srcdir}/data" "${pkgdir}/opt/bloomeetunes/data"
  cp --preserve=mode -r "${srcdir}/lib" "${pkgdir}/opt/bloomeetunes/lib"

  install -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"

}
