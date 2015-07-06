# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=plcash
pkgver=2.4.2392
pkgrel=1
pkgdesc="A personal finance program"
arch=('any')
url="http://www.arachnoid.com/PLCash/index.html"
license=('custom:careware')
depends=('bash' 'java-environment')
source=(http://www.arachnoid.com/PLCash/PLCash.jar
        "http://www.arachnoid.com/lutusp/old_articles/careware.rtf"
        "${pkgname}.desktop"
        "${pkgname}.sh")
noextract=("PLCash.jar")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -O %o %u') # curl doesn't work

package() {
  cd "${srcdir}"

  # Install program files
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 PLCash.jar "${pkgdir}/usr/share/${pkgname}/PLCash.jar"

  # Install a desktop entry
  bsdtar -xf PLCash.jar icons/PLCash.png
  install -Dm644 icons/PLCash.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a license file
  install -Dm644 careware.rtf "${pkgdir}/usr/share/licenses/${pkgname}/careware.rtf"
}
md5sums=('8872789ec4640ebce42f597b6f6d1c3d'
         'b2c3dc9852bff89756c89f957089374f'
         '59d599d2b0d794794bf60eb9d292d4c2'
         '9aeba04f9b6bec9ab305b97f7803bec9')
sha256sums=('453c88773a1278c6b455c61895573048a3591a7667adb7eeec3b90018f62051a'
            'b170b0beb4fee26fb9f60529cf87d418396571459b95210b19437596407d3426'
            'a026adec60ba6a522ff6ea2c4701b94fe16167ce0049e94b5c713d304d71f24e'
            '8209c65df4e95ec6658146d2024ac939bcf5bcabab2c7d7c91211cb195ad4716')
