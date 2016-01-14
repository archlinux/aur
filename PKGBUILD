pkgname=otf-libre-caslon
pkgver=1.0
pkgrel=1
pkgdesc='A free Caslon font designed by Pablo Impallari'
arch=('any')
# Github sources are at https://github.com/impallari/Libre-Caslon-Text
# and the project overview is at
# http://www.impallari.com/projects/overview/libre-caslon-display-and-text,
# but I'm providing the URL to the TeX package maintained by Bob Tennent,
# as he fixed up the metadata (so programs recognize bold as bold, etc.)
# and created a bold italic variant.
# See https://github.com/impallari/Libre-Caslon-Text/issues/3
url='https://www.ctan.org/tex-archive/fonts/librecaslon'
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=otf-libre-caslon.install
ctanbase='http://mirrors.ctan.org/fonts/librecaslon'
source=("$ctanbase/doc/OFL.txt"
        "$ctanbase/opentype/LibreCaslonText-Bold.otf"
        "$ctanbase/opentype/LibreCaslonText-BoldItalic.otf"
        "$ctanbase/opentype/LibreCaslonText-Italic.otf"
        "$ctanbase/opentype/LibreCaslonText-Regular.otf"
       )
noextract=("${source[@]%%::*}") # Don't extract anything
md5sums=('8e184cec6e2a8bf0423341399083fa07'
         '6cdec38ecd76b81386a744985bbdea86'
         'a8a0aaf422b28e3e511dac87c064657b'
         'ee0f2d6f2d7b58227740189d0989cb11'
         '79800978e881ff893177369171de12a7'
        )

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
